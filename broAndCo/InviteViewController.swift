//
//  InviteViewController.swift
//  broAndCo
//
//  Created by user201819 on 8/10/21.
//

import UIKit
import RSFormView

class InviteViewController: UIViewController, FormViewDelegate{
    
    //Email for validation: usedemail@blinq.app
    
    //MARK: UIcomponents
    var formView = FormView()
    var submitButton = UIButton(type: .custom)
    var descriptionLabel = UILabel()
    
    var formHelper = InviteViewModel()
    
    var name: String = ""
    var email: String = ""
    var errMess: String = ""
    var isSuccess: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Invite Details"
        view.backgroundColor = .white
        configureViews()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
    }
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    func configureViews(){
        configureFormView()
        configureLabels()
        configureSubmitButton()
        configureConstraints()
    }
    
    func configureSubmitButton(){
        updateSubmitButton(enabled: false)
        submitButton.layer.cornerRadius = 8
        submitButton.setTitle("Send", for: .normal)
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        view.addSubview(submitButton)
    }
    
    func configureLabels(){
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = UIColor.brightGray
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = "Welcome to Brocoli and Co."
        descriptionLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        view.addSubview(descriptionLabel)
    }
    
    
    func configureFormView() {
        formView.delegate = self
        formView.viewModel = formHelper
        formView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(formView)
    }
    
    func configureConstraints(){
        let horizontalMargins: CGFloat = 32
        let verticalMargins: CGFloat = 10
        let submitButtonMargins: CGFloat = 24
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalMargins * 3),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargins),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalMargins),
            descriptionLabel.bottomAnchor.constraint(equalTo: formView.topAnchor, constant: -verticalMargins*4),
            
            formView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            formView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            formView.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -verticalMargins),
            
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: submitButtonMargins),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -submitButtonMargins),
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -submitButtonMargins),
            submitButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func updateSubmitButton(enabled: Bool) {
        let backgroundColor = enabled ? UIColor.dodgerBlue : UIColor.brightGray.withAlphaComponent(0.4)
        submitButton.backgroundColor = backgroundColor
        submitButton.isUserInteractionEnabled = enabled
    }
    
    func didUpdateFields(in formView: FormView, allFieldsValid: Bool){
        updateSubmitButton(enabled: allFieldsValid)
    }
    
    @objc
    func submitButtonTapped(sender: UIButton!) {
        formHelper.fields().forEach {
            if ($0.name == "NAME" )
            {
                name = $0.value
            }
            if ($0.name == "EMAIL" )
            {
                email = $0.value
            }
        }
        checkDetails(name: name, email: email) { (isSuccess) in
            print("done")
         }
    }
    
    func checkDetails(name: String,  email: String, _ completion:@escaping (_ isSuccess:Bool)->Void) {
        
        let body: [String: Any] = ["name": name, "email": email]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        let url = URL(string: "https://us-central1-blinkapp-684c1.cloudfunctions.net/fakeAuth")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            
            print("-----> data: \(String(describing: data))")
            print("-----> error: \(String(describing: error))")
            print("status")
            
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                print("Content-Type: \(response.allHeaderFields["Content-Type"] ?? "")")
                print("statusCode: \(response.statusCode)")
                print(String(data: data, encoding: .utf8) ?? "")
                
                let ses = String(data: data, encoding: .utf8) ?? ""
                let jsonData = ses.data(using: .utf8)
                if response.statusCode == 400 {
                    let response1: Response = try! JSONDecoder().decode(Response.self, from: jsonData ?? data)
                    DispatchQueue.main.async {
                        errMess = response1.errorMessage
                        completion(false)
                        isSuccess = false
                        let alert = UIAlertController(title: "Error Message", message: errMess, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                        self.present(alert, animated: true)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(false)
                        isSuccess = true
                        let vc = CongratulationsViewController()
                        vc.view.backgroundColor = .white
                        self.navigationController?.pushViewController(vc, animated: true)
                        self.navigationItem.setHidesBackButton(true, animated: true)
                        print("next view")
                    }
                }
            }
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> responseJSON: \(String(describing: responseJSON))")
            
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
            }
        }
        task.resume()
    }
    
    struct Response: Decodable {
        let errorMessage: String
    }
}

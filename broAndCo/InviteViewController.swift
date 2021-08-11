//
//  InviteViewController.swift
//  broAndCo
//
//  Created by user201819 on 8/10/21.
//

import UIKit
import RSFormView

class InviteViewController: UIViewController, FormViewDelegate{
    
    //MARK: UIcomponents
    var formView = FormView()
    var submitButton = UIButton(type: .custom)
    var descriptionLabel = UILabel()
    
    var formHelper = InviteViewModel()
    
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
            let vc = CongratulationsViewController()
            vc.view.backgroundColor = .white
            navigationController?.pushViewController(vc, animated: true)
            self.navigationItem.setHidesBackButton(true, animated: true)
        }
}

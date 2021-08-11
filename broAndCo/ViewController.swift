//
//  ViewController.swift
//  broAndCo
//
//  Created by user201819 on 8/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    //to check if the user has sent the invite prior
    var isLoggedin: Bool =  UserDefaults.standard.bool(forKey: "myLogin")
    
    //image view loading the image on the screen
    let someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "Brocoli_and_Co.png") //image path
        theImageView.translatesAutoresizingMaskIntoConstraints = false // the image is added to your view
        return theImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(someImageView)
        someImageViewConstraints()
        buttonConstraints()
        nameConstraints()
        titleConstraints()
    }
    
    //if the user sent an invite before, move to this view
    func showCancelScreen() {
        DispatchQueue.main.async {
            let vc = CancelViewController()
            vc.view.backgroundColor = .white
            self.navigationController?.pushViewController(vc, animated: true)
            self.navigationItem.setHidesBackButton(true, animated: true)
        }
    }
    
    //on button press, the invite details view is shown
    @objc func buttonAction(sender: UIButton!) {
        let rootVC = InviteViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    //Constraints for the button
    func buttonConstraints() {
        let button = UIButton(frame: CGRect(x: 200, y: 200, width: 100, height: 10))
        button.backgroundColor =  UIColor.systemGreen //button color
        button.setTitle(" Request Invite ", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.layer.cornerRadius = button.frame.height / 2 //rounded corners on the button
        button.clipsToBounds = true
        button.tintColor = UIColor.white
        
        
        self.view.addSubview(button)// add the button to the view, with constraints
        
        button.translatesAutoresizingMaskIntoConstraints = false //dont use autolayout constraints
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true //center the button on the x axis
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200).isActive = true //set a bottom anchor to the button
        
    }
    
    //constraints for the name label
    func nameConstraints() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "Welcome to Brocolli & Co."
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -250).isActive = true // above the button
    }
    
    // title label constraints
    func titleConstraints() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "Brocolli & Co."
        label.font = UIFont.systemFont(ofSize: 30.0)
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true //set at the top of the view
    }
    
    //image constraints
    func someImageViewConstraints() {
        someImageView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        someImageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        someImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        someImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true //position the image in the center of the view
        someImageView.contentMode = .scaleAspectFit //make the image scale to fit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}


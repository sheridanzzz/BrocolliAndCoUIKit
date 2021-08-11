//
//  CancelInviteViewController.swift
//  broAndCo
//
//  Created by user201819 on 8/10/21.
//

import UIKit

class CancelInviteViewController: UIViewController {
    
    let someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "Brocoli_and_Co.png")
        theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        return theImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(someImageView)
        someImageViewConstraints()
        buttonConstraints()
        nameConstraints()
        titleConstraints()
        // Do any additional setup after loading the view.
    }
    
    func buttonConstraints() {
        let button = UIButton(frame: CGRect(x: 200, y: 200, width: 100, height: 10))
        button.backgroundColor =  UIColor.systemGreen
        button.setTitle(" Cancel Invite ", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true
        button.tintColor = UIColor.white
        
        
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200).isActive = true
        
    }
    
    func pressed()
    {
        let vc = CancelViewController()
        vc.view.backgroundColor = .white
        navigationController?.pushViewController(vc, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let alert = UIAlertController(title: "Are you sure you want to delete this?", message: "Can't Undo", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { action in
            self.pressed()
        }))
        
        self.present(alert, animated: true)
        
    }
    
    func nameConstraints() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "Welcome to Brocolli & Co."
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -250).isActive = true
    }
    
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
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
    }
    
    func someImageViewConstraints() {
        someImageView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        someImageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        someImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        someImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10).isActive = true
        someImageView.contentMode = .scaleAspectFit
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

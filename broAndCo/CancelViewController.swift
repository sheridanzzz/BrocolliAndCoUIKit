//
//  CancelViewController.swift
//  broAndCo
//
//  Created by user201819 on 8/10/21.
//

import UIKit
import SwiftConfettiView

class CancelViewController: UIViewController {
    
    //image fot the confetti
    let sadFace = UIImage(named: "sadff")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        //attach the confetti view to the whole view
        let confettiView = SwiftConfettiView(frame: self.view.bounds)
        confettiView.intensity = 1
        confettiView.type = .image(sadFace!)
        confettiView.startConfetti()
        self.view.addSubview(confettiView)
        emojiConstraints()
        labelConstraints()
        cancelButtonConstraints()
    }
    
    func emojiConstraints() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.textAlignment = .center
        label.text = "😞"
        label.font = UIFont.systemFont(ofSize: 60.0)
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300).isActive = true
        
    }
    
    func labelConstraints() {
        let label = UILabel(frame: CGRect(x: 200, y: 800, width: 200, height: 21))
        label.center = CGPoint(x: 200, y: 480)
        label.textAlignment = .center
        label.text = "Invite Cancelled!"
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400).isActive = true
    }
    
    func cancelButtonConstraints() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        button.setTitle("Close", for: .normal)
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true
        button.tintColor = UIColor.white
        button.setTitleColor(.systemBlue, for: .normal)
        
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 430).isActive = true
    }
    
    //move to the next view on button press
    @objc func cancelAction(sender: UIButton!) {
        let vc = ViewController()
        vc.view.backgroundColor = .white
        navigationController?.pushViewController(vc, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true)
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

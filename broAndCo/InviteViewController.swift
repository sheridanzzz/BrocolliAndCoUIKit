//
//  InviteViewController.swift
//  broAndCo
//
//  Created by user201819 on 8/10/21.
//

import UIKit

class InviteViewController: UIViewController, UITextFieldDelegate {
    
    let someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "Brocoli_and_Co.png")
        theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        return theImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Invite Details"
        view.addSubview(someImageView)
        view.backgroundColor = .white
        someImageViewConstraints()
        NameConstraints()
        EmailConstraints()
        ConfirmEmailConstraints()
        sendButtonConstraints()
        cancelButtonConstraints()
    }
    
    func NameConstraints() {
        let myColor = UIColor.black
        let nameTextField =  UITextField(frame: CGRect(x: 40, y: 300, width: 300.00, height: 30.00))
        nameTextField.placeholder = "Enter Full Name"
        nameTextField.font = UIFont.systemFont(ofSize: 15)
        nameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        nameTextField.autocorrectionType = UITextAutocorrectionType.no
        nameTextField.keyboardType = UIKeyboardType.default
        nameTextField.returnKeyType = UIReturnKeyType.done
        nameTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        nameTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        nameTextField.layer.borderColor = myColor.cgColor
        nameTextField.layer.borderWidth = 2.0
        nameTextField.layer.cornerRadius = 15.0
        nameTextField.setLeftPaddingPoints(10)
        nameTextField.setRightPaddingPoints(10)
        nameTextField.delegate = self
        
        self.view.addSubview(nameTextField)
    }
    
    func EmailConstraints() {
        let myColor = UIColor.black
        let emailTextField =  UITextField(frame: CGRect(x: 40, y: 350, width: 300.00, height: 30.00))
        emailTextField.placeholder = "Enter Email Address"
        emailTextField.font = UIFont.systemFont(ofSize: 15)
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.autocorrectionType = UITextAutocorrectionType.no
        emailTextField.keyboardType = UIKeyboardType.default
        emailTextField.returnKeyType = UIReturnKeyType.done
        emailTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        emailTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        emailTextField.layer.borderColor = myColor.cgColor
        emailTextField.layer.borderWidth = 2.0
        emailTextField.layer.cornerRadius = 15.0
        emailTextField.setLeftPaddingPoints(10)
        emailTextField.setRightPaddingPoints(10)
        emailTextField.delegate = self
        
        self.view.addSubview(emailTextField)
    }
    
    func ConfirmEmailConstraints() {
        let myColor = UIColor.black
        let conEmailTextField =  UITextField(frame: CGRect(x: 40, y: 400, width: 300.00, height: 30.00))
        conEmailTextField.placeholder = "Confirm Email Address"
        conEmailTextField.font = UIFont.systemFont(ofSize: 15)
        conEmailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        conEmailTextField.autocorrectionType = UITextAutocorrectionType.no
        conEmailTextField.keyboardType = UIKeyboardType.default
        conEmailTextField.returnKeyType = UIReturnKeyType.done
        conEmailTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        conEmailTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        conEmailTextField.layer.borderColor = myColor.cgColor
        conEmailTextField.layer.borderWidth = 2.0
        conEmailTextField.layer.cornerRadius = 15.0
        conEmailTextField.setLeftPaddingPoints(10)
        conEmailTextField.setRightPaddingPoints(10)
        conEmailTextField.delegate = self
        
        self.view.addSubview(conEmailTextField)
    }
    
    
    func someImageViewConstraints() {
        someImageView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        someImageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        someImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        someImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        someImageView.contentMode = .scaleAspectFit
    }
    
    
    func sendButtonConstraints() {
        let button = UIButton(frame: CGRect(x: 200, y: 450, width: 100, height: 40))
        button.backgroundColor =  UIColor.black
        button.setTitle("Send", for: .normal)
        button.addTarget(self, action: #selector(sendAction), for: .touchUpInside)
        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true
        button.tintColor = UIColor.white
    
        self.view.addSubview(button)
    }
    
    @objc func sendAction(sender: UIButton!) {
        let vc = CongratulationsViewController()
        vc.view.backgroundColor = .white
        navigationController?.pushViewController(vc, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func cancelButtonConstraints() {
        let button = UIButton(frame: CGRect(x: 80, y: 450, width: 100, height: 40))
        button.backgroundColor =  UIColor.black
        button.setTitle("Cancel", for: .normal)
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true
        button.tintColor = UIColor.white
    
        self.view.addSubview(button)
    }
    
    @objc func cancelAction(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

// MARK:- ---> UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("TextField should snd editing method called")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("While entering the characters this method gets called")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        // may be useful: textField.resignFirstResponder()
        return true
    }
    
}

// MARK: UITextFieldDelegate <---


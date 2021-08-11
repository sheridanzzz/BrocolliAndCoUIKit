//
//  InviteViewModel.swift
//  broAndCo
//
//  Created by Sheridan's Lair on 11/08/21.
//

import Foundation
import RSFormView

class InviteViewModel: FormViewModel {
    
    var items: [FormItem] = []
    
    init() {
        items = [NameItem(), EmailItem(),
                 confirmEmailItem()]
    }
    
    enum FieldName: String {
        case name = "NAME"
        case email = "EMAIL"
        case confirmEmail = "CONFIRM EMAIL"
    }
    
    var collectedData: String {
        var data = ""
        
        fields().forEach {
            data += "\($0.name): \($0.value) \n"
        }
        
        return data
    }
    
    //Validate the name
    func NameItem() -> FormItem {
        let nameField = FormField(name: FieldName.name.rawValue,
                                  initialValue: "",
                                  placeholder: FieldName.name.rawValue,
                                  fieldType: .regular,
                                  isValid: false,
                                  errorMessage: "Must be at least 3 characters long")
        nameField.minimumTextLength = 3
        return TextFieldCellItem(with: nameField)
    }
    
    //validate the email
    func EmailItem() -> FormItem {
        let emailField = FormField(name: FieldName.email.rawValue,
                                   initialValue: "",
                                   placeholder: FieldName.email.rawValue,
                                   fieldType: .email,
                                   isValid: false,
                                   errorMessage: "Please enter a valid email")
        return TextFieldCellItem(with: emailField)
    }
    
    //check if the emails match
    func confirmEmailItem() -> FormItem {
        let confirmEmailField = FormField(name: FieldName.confirmEmail.rawValue,
                                          initialValue: "",
                                          placeholder: FieldName.confirmEmail.rawValue,
                                          fieldType: .email,
                                          isValid: false,
                                          errorMessage: "Emails don't match")
        confirmEmailField.validationMatch = FieldName.email.rawValue
        
        return TextFieldCellItem(with: confirmEmailField)
    }
}

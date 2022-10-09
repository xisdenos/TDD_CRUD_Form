//
//  SignupFormModelValidator.swift
//  TDD_CRUD-Form
//
//  Created by Lucas Pinto on 08/10/22.
//

import Foundation

class SignupFormModelValidator {
    
    var firstName: String
    var password: String
    
    init(firstName: String, password: String) {
        self.firstName = firstName
        self.password = password
    }
    
    //MARK: - firstName validators
    
    func isFirstNameNotEmpty() -> (Result<Bool, FormModelValidatorFirstNameError>) {
        if firstName.isEmpty {
            return .failure(FormModelValidatorFirstNameError.emptyName)
        }
        
        return .success(true)
    }
    
    func correctNameLength() -> (Result<Bool, FormModelValidatorFirstNameError>) {
        
        if firstName.count <= 3 {
            return .failure(FormModelValidatorFirstNameError.nameTooShort)
        }
            
        if firstName.count >= 13 {
            return .failure(FormModelValidatorFirstNameError.nameTooLong)
        }
        
        return .success(true)
    }
    
    //MARK: - password validators
    
    func isPasswordNotEmpty() -> (Result<Bool, FormModelValidatorPasswordError>) {
        if password.isEmpty {
            return .failure(FormModelValidatorPasswordError.emptyPassword)
        }
        
        return .success(true)
    }
    
    func correctPasswordLength() -> (Result<Bool, FormModelValidatorPasswordError>) {
        
        if password.count <= 7 {
            return .failure(FormModelValidatorPasswordError.passwordTooShort)
        }
        
        if password.count >= 25 {
            return .failure(FormModelValidatorPasswordError.passwordTooLong)
        }
        
        return .success(true)
    }
    
}

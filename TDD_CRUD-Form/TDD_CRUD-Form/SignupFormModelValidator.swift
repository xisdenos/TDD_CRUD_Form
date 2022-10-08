//
//  SignupFormModelValidator.swift
//  TDD_CRUD-Form
//
//  Created by Lucas Pinto on 08/10/22.
//

import Foundation

class SignupFormModelValidator {
    
    var firstName: String
    
    init(firstName: String) {
        self.firstName = firstName
    }
    
    func isFirstNameNotEmpty() -> (Result<Bool, FormModelValidatorError>) {
        if firstName.isEmpty {
            return .failure(FormModelValidatorError.emptyName)
        }
        
        return .success(true)
    }
    
    func correctNameLength() -> (Result<Bool, FormModelValidatorError>) {
        
        if firstName.count <= 3 {
            return .failure(FormModelValidatorError.nameTooShort)
        }
            
        if firstName.count >= 13 {
            return .failure(FormModelValidatorError.nameTooLong)
        }
        
        return .success(true)
    }
}

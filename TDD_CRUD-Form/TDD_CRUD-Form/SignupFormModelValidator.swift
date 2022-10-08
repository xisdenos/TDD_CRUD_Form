//
//  SignupFormModelValidator.swift
//  TDD_CRUD-Form
//
//  Created by Lucas Pinto on 08/10/22.
//

import Foundation

class SignupFormModelValidator {
    
    func isFirstNameNotEmpty(firstName: String) -> (Result<Bool, FormModelValidatorError>) {
        var returnValue = true
        
        if firstName.isEmpty {
            return .failure(FormModelValidatorError.emptyName)
        }
        
        return .success(true)
    }
}

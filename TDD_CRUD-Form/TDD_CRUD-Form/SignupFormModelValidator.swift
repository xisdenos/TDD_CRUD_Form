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
    var email: String
    
    init(firstName: String, password: String, email: String) {
        self.firstName = firstName
        self.password = password
        self.email = email
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
    
    func doesPasswordContainsNumbers() -> (Result<Bool, FormModelValidatorPasswordError>) {
        
        for character in password {
            if character.isNumber {
                return .success(true)
            }
        }
        return .failure(FormModelValidatorPasswordError.passwordNotContainNumbers)
    }
    
    
    func doesPasswordContainsLetters() -> (Result<Bool, FormModelValidatorPasswordError>) {
        
        for character in password {
            if character.isLetter {
                return .success(true)
            }
        }
        return .failure(FormModelValidatorPasswordError.passwordNotContainLetters)
    }
    
    func doesPasswordContainsSpecialCharacters() -> (Result<Bool, FormModelValidatorPasswordError>) {
        
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        if password.rangeOfCharacter(from: characterset.inverted) != nil {
            return .success(true)
        }
        return .failure(FormModelValidatorPasswordError.passwordNotContainSpecialCharacters)
    }
    
    func doesPasswordContainsEmptySpaces() -> (Result<Bool, FormModelValidatorPasswordError>) {
        
        for character in password {
            if character == " " {
                return .failure(FormModelValidatorPasswordError.passwordContainsEmptySpaces)
            }
        }
        return .success(true)
    }
    
    //MARK: - email validators
    
    func isEmailNotEmpty() -> (Result<Bool, FormModelValidatorEmailError>) {
        if email.isEmpty {
            return .failure(FormModelValidatorEmailError.emptyEmail)
        }
        return .success(true)
    }
    
    func isEmailWithCorrectFormat() -> (Result<Bool, FormModelValidatorEmailError>) {
        
        if email.contains("@") && email.contains(".") {
            return .success(true)
        }
        return .failure(FormModelValidatorEmailError.wrongFormat)
    }
}


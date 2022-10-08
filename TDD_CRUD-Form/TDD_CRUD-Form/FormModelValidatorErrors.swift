//
//  FormModelValidatorError.swift
//  TDD_CRUD-Form
//
//  Created by Lucas Pinto on 08/10/22.
//

import Foundation

enum FormModelValidatorFirstNameError: Error {
    case emptyName
    case nameTooShort
    case nameTooLong
}

enum FormModelValidatorPasswordError: Error {
    case emptyPassword
    case passwordTooShort
    case passwordTooLong
    case passwordNotContainNumbers
    case passwordNotContainLetters
    case passwordNotContainSpecialCharacters
}

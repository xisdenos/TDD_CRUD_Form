//
//  FormModelValidatorError.swift
//  TDD_CRUD-Form
//
//  Created by Lucas Pinto on 08/10/22.
//

import Foundation

enum FormModelValidatorError: Error {
    case emptyName
    case nameTooShort
    case nameTooLong
}

//
//  SignUpModelFormEmailValidatorTest.swift
//  TDD_CRUD-FormTests
//
//  Created by Lucas Pinto on 10/10/22.
//

import XCTest
@testable import TDD_CRUD_Form

final class SignUpModelFormEmailValidatorTest: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        sut = SignupFormModelValidator(firstName: "generic_name", password: "generic_password", email: "lucas@email.com")
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testSignUpModelFormValidator_WhenNotEmptyEmailProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        
        // Assert
    }
}

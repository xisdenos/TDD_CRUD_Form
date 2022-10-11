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
        let emailIsValid = sut.isEmailNotEmpty()
        // Assert
        switch emailIsValid {
        case .success(let result):
            XCTAssertTrue(result)
            
        case .failure( _ ):
            XCTFail("The isEmailNotEmpty() should have returned TRUE for a not empty first name but returned FALSE")
        }

    }
    
    func testSignUpModelFormValidator_WhenEmptyEmailProvided_ShouldReturnEmptyEmailError() {
        
        // Arrange
        // Act
        sut.email = ""
        let emailIsValid = sut.isEmailNotEmpty()
        
        // Assert
        switch emailIsValid {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure(let error):
            XCTAssertEqual(error, FormModelValidatorEmailError.emptyEmail, "The isEmailNotEmpty() should have returned correct empty name error but returned \(error)")
        }
    }
    
    func testSignUpModelFormValidator_WhenCorrectEmailFormatProvided_ShouldReturnEmptyEmailError() {
        
        // Arrange
        // Act
        let emailCorrectFormat = sut.isEmailWithCorrectFormat()
        // Assert
        switch emailCorrectFormat {
        case .success(let result):
            XCTAssertTrue(result)
            
        case .failure( _ ):
            XCTFail("The isEmailWithCorrectFormat() should have returned TRUE for an email with @ and . but returned FALSE")
        }
    }
    
    func testSignUpModelFormValidator_WhenNotEmptyEmailProvided_ShouldReturnWrongFormatEmailError() {
        
        // Arrange
        // Act
        sut.email = "lucasgmail.com"
        let emailIncorrectFormat = sut.isEmailWithCorrectFormat()
        
        // Assert
        switch emailIncorrectFormat {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure(let error):
            XCTAssertEqual(error, FormModelValidatorEmailError.wrongFormat, "The isEmailWithCorrectFormat() should have returned correct wrong email format error but returned \(error)")
        }
    }
}

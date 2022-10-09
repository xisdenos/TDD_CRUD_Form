//
//  SignUpModelFormPasswordValidatorTest.swift
//  TDD_CRUD-FormTests
//
//  Created by Lucas Pinto on 08/10/22.
//

import XCTest
@testable import TDD_CRUD_Form

final class SignUpModelFormPasswordValidatorTest: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        sut = SignupFormModelValidator(firstName: "generic_name", password: "12345678")
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testSignUpModelFormValidator_WhenNotEmptyPasswordProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let passwordValid = sut.isPasswordNotEmpty()
        // Assert
        switch passwordValid {
        case .success(let result):
            XCTAssertTrue(result)
            
        case .failure( _ ):
            XCTFail("The isPasswordNotEmpty() should have returned TRUE for a not empty first name but returned FALSE")
        }
    }
    
    func testSignUpModelFormValidator_WhenEmptyPasswordProvided_ShouldReturnEmptyError() {
        
        // Arrange
        // Act
        sut.password = ""
        let passwordValid = sut.isPasswordNotEmpty()
        // Assert
        switch passwordValid {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure(let error):
            XCTAssertEqual(error, FormModelValidatorPasswordError.emptyPassword, "The isPasswordNotEmpty() should have returned correct empty password error but returned \(error)")
        }
    }
    
    func testSignUpModelFormValidator_WhenPasswordProvided_ShouldRespectCorrectLength() {
        
        // Arrange
        // Act
        let passwordValid = sut.correctPasswordLength()
        
        // Assert
        switch passwordValid {
        case .success(let result):
            XCTAssertTrue(result)
            
        case .failure( _ ):
            XCTFail("The correctNameLength() should have returned TRUE for a first name with size beetween 8 and 24 but returned FALSE")
        }
    }
    
    func testSignUpModelFormValidator_WhenShortPasswordProvided_ShouldReturnShortLengthError() {
        
        // Arrange
        // Act
        sut.password = "1234567"
        let correctLengthPassword = sut.correctPasswordLength()
        
        // Assert
        switch correctLengthPassword {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure( let error ):
            XCTAssertEqual(error, FormModelValidatorPasswordError.passwordTooShort, "The correctLengthFirstName() should have returned \(FormModelValidatorPasswordError.passwordTooShort) but returned \(error) instead")
        }
    }
    
    func testSignUpModelFormValidator_WhenLongPasswordProvided_ShouldReturnLongLengthError() {
        
        // Arrange
        // Act
        sut.password = "123456789123456789123456789"
        let correctLengthPassword = sut.correctPasswordLength()
        
        // Assert
        switch correctLengthPassword {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure( let error ):
            XCTAssertEqual(error, FormModelValidatorPasswordError.passwordTooLong, "The correctLengthFirstName() should have returned \(FormModelValidatorPasswordError.passwordTooLong) but returned \(error) instead")
        }
    }
}

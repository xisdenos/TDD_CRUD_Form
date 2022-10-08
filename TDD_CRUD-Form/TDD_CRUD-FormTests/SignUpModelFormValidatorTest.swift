//
//  SignUpModelFormValidatorTest.swift
//  TDD_CRUD-FormTests
//
//  Created by Lucas Pinto on 08/10/22.
//

// Arrange

// Act

// Assert

import XCTest
@testable import TDD_CRUD_Form

final class SignUpModelFormValidatorTest: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        sut = SignupFormModelValidator(firstName: "Lucas")
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testSignUpModelFormValidator_WhenNotEmptyFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let firstNameValid = sut.isFirstNameNotEmpty()
        
        // Assert
        switch firstNameValid {
        case .success(let result):
            XCTAssertTrue(result)
            
        case .failure( _ ):
            XCTFail("The isfirstNameValid() should have returned TRUE for a not empty first name but returned FALSE")
        }
    }
    
    func testSignUpModelFormValidator_WhenEmptyFirstNameProvided_ShouldReturnEmptyError() {
        
        // Arrange
        // Act
        sut.firstName = ""
        let firstNameValid = sut.isFirstNameNotEmpty()
        
        // Assert
        switch firstNameValid {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure(let error):
            XCTAssertEqual(error, FormModelValidatorFirstNameError.emptyName, "The isfirstNameValid() should have returned correct empty name error but returned \(error)")
        }
    }
    
    func testSignUpModelFormValidator_WhenFirstNameProvided_ShouldRespectCorrectLength() {
        
        // Arrange
        // Act
        let correctLengthFirstName = sut.correctNameLength()
        
        // Assert
        switch correctLengthFirstName {
        case .success(let result):
            XCTAssertTrue(result)
            
        case .failure( _ ):
            XCTFail("The correctLengthFirstName() should have returned TRUE for a first name with size beetween 4 and 12 but returned FALSE")
        }
    }
    
    func testSignUpModelFormValidator_WhenShortFirstNameProvided_ShouldReturnShortLengthError() {
        
        // Arrange
        // Act
        sut.firstName = "Luc"
        let correctLengthFirstName = sut.correctNameLength()
        
        // Assert
        switch correctLengthFirstName {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure( let error ):
            XCTAssertEqual(error, FormModelValidatorFirstNameError.nameTooShort, "The correctLengthFirstName() should have returned \(FormModelValidatorFirstNameError.nameTooShort) but returned \(error) instead")
        }
    }
    
    func testSignUpModelFormValidator_WhenLongFirstNameProvided_ShouldReturnLongLengthError() {
        
        // Arrange
        // Act
        sut.firstName = "Lucasvcghfhfhfghfghf"
        let correctLengthFirstName = sut.correctNameLength()
        
        // Assert
        switch correctLengthFirstName {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure( let error ):
            XCTAssertEqual(error, FormModelValidatorFirstNameError.nameTooLong, "The correctLengthFirstName() should have returned \(FormModelValidatorFirstNameError.nameTooLong) but returned \(error) instead")
        }
    }

}

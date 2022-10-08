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

final class SignUpModelFormValidator: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testSignUpModelFormValidator_WhenNotEmptyFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let firstNameValid = sut.isFirstNameNotEmpty(firstName: "s")
        
        // Assert
        switch firstNameValid {
        case .success(let result):
            XCTAssertTrue(result)
            
        case .failure( _ ):
            XCTFail("The isfirstNameValid() should have returned True for a valid first name but returned false")
        }
    }
    
    func testSignUpModelFormValidator_WhenEmptyFirstNameProvided_ShouldReturnEmptyError() {
        
        // Arrange
        // Act
        let firstNameValid = sut.isFirstNameNotEmpty(firstName: "")
        
        // Assert
        switch firstNameValid {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure(let error):
            XCTAssertEqual(error, FormModelValidatorError.emptyName, "The isfirstNameValid() should have returned correct empty name error but returned \(error)")
        }
    }
    
    func testSignUpModelFormValidator_WhenFirstNameProvided_ShouldRespectCorrectLength() {
        
        // Arrange
        // Act
        let correctLengthFirstName = sut.isFirstNameNotEmpty(firstName: "Lucas")
        
        // Assert
        
    }

}

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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpModelFormValidator_WhenNotEmptyFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        let sut = SignupFormModelValidator()
        
        // Act
        let firstNameValid = sut.isFirstNameNotEmpty(firstName: "Lucas")
        
        // Assert
        
        XCTAssertTrue(firstNameValid, "The isfirstNameValid() should have returned True for a valid first name but returned false")
    }

}

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
        sut = SignupFormModelValidator(firstName: "generic_name", password: "123456789Bola/", email: "generic_email")
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
    
    // Validator for numbers
    
    func testSignUpModelFormValidator_WhenPasswordWithNumbersProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let numberInPassword = sut.doesPasswordContainsNumbers()
        
        // Assert
        switch numberInPassword {
        case .success(let result):
            XCTAssertTrue(result)
            
        case .failure( _ ):
            XCTFail("The doesPasswordContainsNumbers() should have returned TRUE for a password tha contains numbers but returned FALSE")
        }
    }
    
    func testSignUpModelFormValidator_WhenPasswordWithoutNumbersProvided_ShouldThrowNoNumbersError() {
        
        // Arrange
        // Act
        sut.password = "bolaAzulAmarela"
        let numberInPassword = sut.doesPasswordContainsNumbers()
        
        // Assert
        switch numberInPassword {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure(let error):
            XCTAssertEqual(error, FormModelValidatorPasswordError.passwordNotContainNumbers, "The doesPasswordContainsNumbers() should have returned correct no numbers password error but returned \(error)" )
        }
    }
    
    // Validator for Letters
    
    func testSignUpModelFormValidator_WhenPasswordWithLettersProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let lettersInPassword = sut.doesPasswordContainsLetters()
        
        // Assert
        switch lettersInPassword {
        case .success(let result):
            XCTAssertTrue(result)
            
        case .failure( _ ):
            XCTFail("The doesPasswordLetters() should have returned TRUE for a password tha contains letters but returned FALSE")
        }
    }
    
    func testSignUpModelFormValidator_WhenPasswordWithoutLettersProvided_ShouldThrowNoLettersError() {
        
        // Arrange
        // Act
        sut.password = "123456789"
        let lettersInPassword = sut.doesPasswordContainsLetters()
        
        // Assert
        switch lettersInPassword {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure(let error):
            XCTAssertEqual(error, FormModelValidatorPasswordError.passwordNotContainLetters, "The doesPasswordLetters() should have returned correct no letters password error but returned \(error)" )
        }
    }
    
    // Validator for Special Characters
    
    func testSignUpModelFormValidator_WhenPasswordWithSpecialCharactersProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let specialCharactersInPassword = sut.doesPasswordContainsSpecialCharacters()
        
        // Assert
        switch specialCharactersInPassword {
        case .success(let result):
            XCTAssertTrue(result)
            
        case .failure( _ ):
            XCTFail("The doesPasswordLetters() should have returned TRUE for a password that contains letters but returned FALSE")
        }
    }
    
    func testSignUpModelFormValidator_WhenPasswordWithoutSpecialCharactersProvided_ShouldThrowNoSpecialCharactersError() {
        
        // Arrange
        // Act
        sut.password = "123456789gh"
        let specialCharactersInPassword = sut.doesPasswordContainsSpecialCharacters()
        
        // Assert
        switch specialCharactersInPassword {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure(let error):
            XCTAssertEqual(error, FormModelValidatorPasswordError.passwordNotContainSpecialCharacters, "The doesPasswordContainsSpecialCharacters() should have returned correct no special characters password error but returned \(error)" )
        }
    }
    
    // Validator for Empty Spaces
    
    func testSignUpModelFormValidator_WhenPasswordWithoutEmptySpaces_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let emptySpacesInPassword = sut.doesPasswordContainsEmptySpaces()
        
        // Assert
        switch emptySpacesInPassword {
        case .success(let result):
            XCTAssertTrue(result)
            
        case .failure( _ ):
            XCTFail("The doesPasswordContainsEmptySpaces() should have returned TRUE for a password without empty spaces but returned FALSE")
        }
    }
    
    func testSignUpModelFormValidator_WhenPasswordWithEmptySpacesProvided_ShouldThrowEmptySpacesCharactersError() {
        
        // Arrange
        // Act
        sut.password = "123456789gh "
        let emptySpacesInPassword = sut.doesPasswordContainsEmptySpaces()
        
        // Assert
        switch emptySpacesInPassword {
        case .success( _ ):
            XCTFail("Test need the result to fail")
            
        case .failure(let error):
            XCTAssertEqual(error, FormModelValidatorPasswordError.passwordContainsEmptySpaces, "The doesPasswordContainsEmptySpaces() should have returned correct empty spaces password error but returned \(error)" )
        }
    }
}


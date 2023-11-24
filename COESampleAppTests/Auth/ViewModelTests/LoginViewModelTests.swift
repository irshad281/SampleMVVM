//
//  LoginViewModelTests.swift
//  COESampleAppTests
//
//  Created by Irshad Ahmad on 22/11/23.
//

import Combine
import XCTest
@testable import COESampleApp

final class LoginViewModelTests: XCTestCase {
    
    func testEmailValidSuccess() {
        let viewModel = LoginViewModel(service: MockAuthService())
        
        // Given
        let email = "test@gmail.com"
        
        // When
        let isValid = viewModel.isEmailValid(email)
        
        // Then
        XCTAssertTrue(isValid, "Entered email is not valid")
    }
    
    func testEmailValidFailure() {
        let viewModel = LoginViewModel(service: MockAuthService())
        
        // Given
        let email = "test@gmail"
        
        // When
        let isValid = viewModel.isEmailValid(email)
        
        // Then
        XCTAssertTrue(!isValid)
    }
    
    func testPasswordValidSuccess() {
        let viewModel = LoginViewModel(service: MockAuthService())
        
        // Given
        let password = "Test@1234"
        
        // When
        let isValid = viewModel.isPasswordValid(password)
        
        // Then
        XCTAssertTrue(isValid, "Password is not matching with validation criteria.")
    }
    
    func testPasswordValidFailure() {
        let viewModel = LoginViewModel(service: MockAuthService())
        
        // Given
        let password = "Test123"
        
        // When
        let isValid = viewModel.isPasswordValid(password)
        
        // Then
        XCTAssertTrue(!isValid)
    }
    
    func testAuthenticateApiIntegrationSuccess() {
        let expectation = expectation(description: "Test LoginViewModel Auth Api")
        // Given
        let viewModel = LoginViewModel(service: MockAuthService())
        var cancellables = Set<AnyCancellable>()
        
        let email = "test@gmail.com"
        let password = "password"
        
        // When
        viewModel.autneticateUser(email: email, password: password)
        
        viewModel.loginResponse.sink { error in
            expectation.fulfill()
        } receiveValue: { result in
            expectation.fulfill()
        }.store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
        
        // Then
        XCTAssertNotNil(viewModel.loginResponse.value, "Authentication api failed.")
    }
}

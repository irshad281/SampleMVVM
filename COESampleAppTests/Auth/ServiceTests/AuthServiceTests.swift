//
//  AuthServiceTests.swift
//  COESampleAppTests
//
//  Created by Irshad Ahmad on 21/11/23.
//

import Combine
import XCTest
@testable import COESampleApp

final class AuthServiceTests: XCTestCase {
    
    var cancellable = Set<AnyCancellable>()
    
    func testAuthServiceSuccess() {
        let expectation = expectation(description: "test auth api")
        // Given
        let service = MockAuthService()
        var result: COESampleApp.AuthModel?
        
        let email = "test@gmail.com"
        let password = "password"
        
        // When
        service.autheticateUser(email: email, password: password).sink { status in
            switch status {
            default:
                expectation.fulfill()
            }
        } receiveValue: { response in
            result = response
        }.store(in: &cancellable)

        wait(for: [expectation], timeout: 5.0)
        
        // Then
        XCTAssertNotNil(result)
        XCTAssertNotNil(result?.name)
    }
}

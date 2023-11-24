//
//  AuthRequestTests.swift
//  COESampleAppTests
//
//  Created by Irshad Ahmad on 21/11/23.
//

import XCTest
import NetworkInterface
@testable import COESampleApp

final class AuthRequestTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAuthRequestEndPoint() {
        // Given
        let request = AuthRequest.autheticateUser(email: "test@gmail.com", password: "123456")
        XCTAssertEqual(request.endPoint, "api/authenticate")
    }
    
    func testAuthRequestHeaders() {
        // Given
        let request = AuthRequest.autheticateUser(email: "test@gmail.com", password: "123456")
        
        let headers: [String: String] = [
            .contentType: .applicationJSON
        ]
        
        XCTAssertEqual(request.headers(), headers)
    }
}

//
//  AuthModelTests.swift
//  COESampleAppTests
//
//  Created by Irshad Ahmad on 21/11/23.
//

import XCTest
@testable import COESampleApp

final class AuthModelTests: XCTestCase {
    
    func testAuthModelDecodingSuccess() {
        guard let url = Bundle(for: AuthModelTests.self).url(forResource: "MockAuthResponse", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let model = try? JSONDecoder().decode(AuthModel.self, from: data)
        else {
            return XCTFail("Unable to decode AuthModel from MockAuthResponse.json")
        }
        
        XCTAssertEqual(model.displayName, "Test")
    }
    
    func testAuthModelDecodingFailure() {
        guard let url = Bundle(for: AuthModelTests.self).url(forResource: "InvalidMockAuthResponse", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let _ = try? JSONDecoder().decode(AuthModel.self, from: data)
        else {
            return XCTAssertTrue(true)
        }
        
        XCTExpectFailure("AuthModel.swift is decodable through invalid json.")
    }
}


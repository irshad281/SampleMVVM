//
//  MockAuthService.swift
//  COESampleAppTests
//
//  Created by Irshad Ahmad on 21/11/23.
//

import Combine
import NetworkInterface
import XCTest
@testable import COESampleApp

final class MockAuthService: AuthServiceProtocol {
    func autheticateUser(email: String, password: String) -> Future<COESampleApp.AuthModel, RequestError> {
        Future<COESampleApp.AuthModel, RequestError> { promise in
            
            guard let url = Bundle(for: MockAuthService.self).url(forResource: "MockAuthResponse", withExtension: "json")
            else {
                return promise(.failure(.unknown))
            }
            
            do {
                let data = try Data(contentsOf: url)
                let model = try JSONDecoder().decode(AuthModel.self, from: data)
                return promise(.success(model))
            } catch {
                return promise(.failure(.decodingError(error: error)))
            }
        }
    }
}

//
//  AuthService.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 21/11/23.
//

import Combine
import Foundation
import NetworkInterface

protocol AuthServiceProtocol {
    func autheticateUser(email: String, password: String) -> Future<AuthModel, RequestError>
}

struct AuthService: AuthServiceProtocol {
    @discardableResult
    func autheticateUser(email: String, password: String) -> Future<AuthModel, RequestError> {
        NetworkInterface.performRequest(AuthRequest.autheticateUser(email: email, password: password))
    }
}

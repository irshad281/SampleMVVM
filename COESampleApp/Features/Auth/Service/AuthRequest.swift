//
//  AuthRequest.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 21/11/23.
//

import Foundation
import NetworkInterface

enum AuthRequest: Request {
    
    case autheticateUser(email: String, password: String)
    
    /// `HTTPMethod` of the request
    var method: HTTPMethod { .post }
    
    /// `Base URL`
    var baseURLString: String { App.baseUrl }
    
    /// `End Point` of the api
    var endPoint: String { "api/authenticate" }
    
    /// `Request Body` to be send
    func body() throws -> Data? {
        switch self {
        case .autheticateUser(let email, let password):
            let params: [String: Any] = [
                "email": email,
                "password": password
            ]
            return try JSONSerialization.data(withJSONObject: params)
        }
    }
    
    /// `Api's Headers` to be send
    func headers() -> [String : String] {
        [
            .contentType: .applicationJSON
        ]
    }
}

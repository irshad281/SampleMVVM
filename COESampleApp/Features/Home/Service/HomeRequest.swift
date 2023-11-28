//
//  HomeRequest.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 25/11/23.
//

import Foundation
import NetworkInterface

enum HomeRequest: Request {
    
    case categories
    case productsByCategory(_ category: String)
    
    /// `HTTPMethod` of the request
    var method: HTTPMethod { .get }
    
    /// `Base URL`
    var baseURLString: String { App.baseUrl }
    
    /// `End Point` of the api
    var endPoint: String {
        switch self {
        case .categories:
            return "products/categories"
        case .productsByCategory(let cat):
            return "products/category/\(cat)"
        }
    }
    
    /// `Request Body` to be send
    func body() throws -> Data? {
        nil
    }
    
    /// `Api's Headers` to be send
    func headers() -> [String: String] {
        [
            .contentType: .applicationJSON
        ]
    }
}

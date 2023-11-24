//
//  AuthModel.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 21/11/23.
//

import Foundation

struct AuthModel: Codable {
    let name, displayName, email: String
    let active: Bool
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case displayName = "display_name"
        case email, active, token
    }
}

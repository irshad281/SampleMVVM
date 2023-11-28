//
//  ConfigurationModel.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 21/11/23.
// swiftlint:disable force_try force_unwrapping

import Foundation

struct ConfigurationModel: Codable {
    let baseURLTest, baseURLDevelopment, baseURLProduction, apiKey: String

    enum CodingKeys: String, CodingKey {
        case baseURLTest = "base_url_test"
        case baseURLDevelopment = "base_url_development"
        case baseURLProduction = "base_url_production"
        case apiKey = "api_key"
    }
    
    init() {
        let url = Bundle.main.url(forResource: "configuration", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        self = try! JSONDecoder().decode(ConfigurationModel.self, from: data)
    }
}

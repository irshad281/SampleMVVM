//
//  Product.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 23/11/23.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description, category: String
    let image: String
}

struct Category: Codable, Identifiable {
    var id = UUID()
    let title: String
    
    init(title: String) {
        self.title = title
    }
}

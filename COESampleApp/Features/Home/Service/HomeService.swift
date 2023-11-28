//
//  HomeService.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 25/11/23.
//

import Combine
import Foundation
import NetworkInterface

protocol HomeServiceProtocol {
    func getProductCategories() -> Response<[String]>
    func getProductsByCategory(_ category: String) -> Response<[Product]>
}

struct HomeService: HomeServiceProtocol {
    
    @discardableResult
    func getProductCategories() -> Response<[String]> {
        NetworkInterface.performRequest(HomeRequest.categories)
    }
    
    @discardableResult
    func getProductsByCategory(_ category: String) -> Response<[Product]> {
        NetworkInterface.performRequest(HomeRequest.productsByCategory(category))
    }
}

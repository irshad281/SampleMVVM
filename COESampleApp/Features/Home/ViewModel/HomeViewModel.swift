//
//  HomeViewModel.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 25/11/23.
//

import Combine
import Foundation
import NetworkInterface

final class HomeViewModel {
    private let service: HomeServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    var sections = Section.allCases
    var categories = CurrentValueSubject<[String], RequestError>([])
    var products = CurrentValueSubject<[Product], RequestError>([])
    var selectedCategory: Int = .zero
    
    init(service: HomeServiceProtocol) {
        self.service = service
        self.getCategories()
    }
    
    enum Section: CaseIterable {
        case category
        case products
    }
}

extension HomeViewModel {
    func numberOfItemsInSection(_ section: Int) -> Int {
        switch sections[section] {
        case .category:
            return categories.value.count
        case .products:
            return products.value.count
        }
    }
}

// MARK: - Service

extension HomeViewModel {
    func getCategories() {
        service.getProductCategories().sink { status in
            switch status {
            case .finished:
                break
            case .failure(let error):
                self.products.send(completion: Subscribers.Completion<RequestError>.failure(error))
            }
        } receiveValue: { categories in
            self.categories.send(categories)
            self.getProductsByCategory()
        }.store(in: &cancellables)
    }
    
    func getProductsByCategory() {
        service.getProductsByCategory(categories.value[selectedCategory]).sink { status in
            switch status {
            case .finished:
                break
            case .failure(let error):
                self.products.send(completion: Subscribers.Completion<RequestError>.failure(error))
            }
        } receiveValue: { products in
            self.products.send(products)
        }.store(in: &cancellables)
    }
}

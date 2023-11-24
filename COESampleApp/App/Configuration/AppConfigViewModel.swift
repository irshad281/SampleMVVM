//
//  AppConfigViewModel.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 21/11/23.
//

import Foundation

class AppConfigViewModel {
    static let shared = AppConfigViewModel()
    
    private let model = ConfigurationModel()
    private var environment: App.Environment = .development
    
    private init () { }
    
    var baseUrl: String {
        switch environment {
        case .development:
            return model.baseURLDevelopment
            
        case .test:
            return model.baseURLTest
            
        case .production:
            return model.baseURLProduction
        }
    }
    
    func configure() {
        
    }
}

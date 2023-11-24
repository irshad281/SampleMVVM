//
//  App.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 21/11/23.
//

import Foundation
import UIKit

typealias Completion = () -> Void

enum App {
    static var baseUrl: String { AppConfigViewModel.shared.baseUrl }
    static var delegate: AppDelegate? { UIApplication.shared.delegate as? AppDelegate }
    
    static func configure() {
        
    }
    
    static func makeRootView() {
        if App.delegate?.window == nil {
            App.delegate?.window = UIWindow(frame: UIScreen.main.bounds)
        }
        App.delegate?.window?.rootViewController = LoginViewController()
        App.delegate?.window?.makeKeyAndVisible()
    }
}

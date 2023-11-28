//
//  App.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 21/11/23.
//  swiftlint:disable type_name

import Combine
import Foundation
import UIKit
import NetworkInterface

typealias Completion = () -> Void
typealias Response<T: Codable> = Future<T, RequestError>

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

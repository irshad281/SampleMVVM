//
//  AppDelegate.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 21/11/23.
//  swiftlint:disable delegate_implementation

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        App.makeRootView()
        
        return true
    }

}

//  swiftlint:enable delegate_implementation

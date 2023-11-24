//
//  Destination.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 22/11/23.
//

import Foundation
import UIKit

enum Destination {
    case dashboard
    case home
    case profile
    
    var controller: UIViewController {
        switch self {
        case .dashboard:
            let controller = UIViewController()
            controller.view.backgroundColor = .green
            return controller
            
        case .home:
            return UIViewController()
            
        case .profile:
            return UIViewController()
        }
    }
}

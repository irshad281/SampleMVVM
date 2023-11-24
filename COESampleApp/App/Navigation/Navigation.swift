//
//  Navigation.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 22/11/23.
//

import Foundation
import UIKit

extension App {
    static func navigate(to destination: Destination, from viewController: UIViewController, mode: Mode = .push, animated: Bool = true) {
        switch mode {
        case .push:
            viewController.navigationController?.pushViewController(destination.controller, animated: animated)
            
        case .present:
            viewController.present(destination.controller, animated: animated)
        }
    }
}

extension App {
    enum Mode {
        case push
        case present
    }
}

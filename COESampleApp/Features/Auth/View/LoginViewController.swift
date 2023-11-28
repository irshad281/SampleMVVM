//
//  LoginViewController.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 21/11/23.
//

import Combine
import NetworkInterface
import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    private var cancellables = Set<AnyCancellable>()
    private let viewModel = LoginViewModel(service: AuthService())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        observerPublishers()
    }
    
    private func observerPublishers() {
        viewModel.loginResponse.sink { [weak self] error in
            // Handle error here..
            print(self ?? "error", error)
        } receiveValue: { [weak self] response in
            // Handle response here..
            print(self ?? "response", response ?? "nil")
        }.store(in: &cancellables)

    }
}

// MARK: - Actions

extension LoginViewController {
    @IBAction private func textDidChange(_ sender: UITextField) {
        
    }
    
    @IBAction private func loginButtonAction(_ sender: UIButton) {
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""
        
        if viewModel.isFormValid(email: email, password: password) {
            viewModel.autneticateUser(email: email, password: password)
            
            // Demo Action
            App.navigate(to: .home, from: self, mode: .present)
        } else {
            // Show Alert...
        }
    }
}

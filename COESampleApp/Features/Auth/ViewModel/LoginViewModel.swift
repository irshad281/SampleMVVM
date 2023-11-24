//
//  LoginViewModel.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 22/11/23.
//

import Combine
import Foundation
import NetworkInterface

final class LoginViewModel {
    
    private let service: AuthServiceProtocol
    var loginResponse = CurrentValueSubject<AuthModel?, RequestError>(nil)
    
    init(service: AuthServiceProtocol) {
        self.service = service
    }
}

// MARK: - Validations

extension LoginViewModel {
    /// This function will tells you the validity of given email
    /// - Parameter email: entered email by user
    /// - Returns: `True/False`
    func isEmailValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    /// This function will tells you the validity of given password. like it contain one special char, one number one upper case
    /// - Parameter password: entered password by user
    /// - Returns: `True/False`
    func isPasswordValid(_ password: String) -> Bool {
        /// Minimum 8 characters, at least one uppercase letter, one lowercase letter, one number and one special character.
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: password)
        return result
    }
    
    /// This function will tells you the validity of login form
    /// - Parameters:
    ///   - email: entered email by user
    ///   - password: entered password by user
    /// - Returns: `True/False`
    func isFormValid(email: String, password: String) -> Bool {
        isEmailValid(email) && isPasswordValid(password)
    }
}

// MARK: - Service

extension LoginViewModel {
    /// This is the authecatinn api executing through network layer.
    /// - Parameters:
    ///   - email: entered email by user
    ///   - password: entered password by user
    func autneticateUser(email: String, password: String) {
        service.autheticateUser(email: email, password: password).sink { status in
            switch status {
            case .finished:
                break
                
            case .failure(let error):
                // Handle Errors...
                self.loginResponse.send(completion: Subscribers.Completion<RequestError>.failure(error))
            }
        } receiveValue: { responce in
            // Handle Response...
            self.loginResponse.send(responce)
            
        }.store(in: &cancellables)
    }
}

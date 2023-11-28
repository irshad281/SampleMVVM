//
//  LoginScreen.swift
//  COESampleAppUITests
//
//  Created by Irshad Ahmad on 28/11/23.
//

import Foundation
import XCTest

final class LoginScreen: XCTestCase {

    private let loginLabel: XCUIElement = XCUIApplication().staticTexts["Login"]
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVisiblityOfScreen() {
        let app = XCUIApplication()
        app.launch()
        guard loginLabel.waitForExistence(timeout: 2.0) else {
            return XCTFail("Login screen is not present")
        }
    }
    
    func testLogin() {
        let app = XCUIApplication()
        app.launch()
        
        let email = app.textFields["Email"]
        email.tap()
        email.typeText("test@gmail.com")
        
        let password = app.secureTextFields["Password"]
        password.tap()
        password.typeText("Test@223223")
        
        let loginButton =  app.buttons["Login"]
        loginButton.tap()
        
        let homeScreen = HomeScreen()
        
        homeScreen.testVisiblityOfScreen()
    }
}

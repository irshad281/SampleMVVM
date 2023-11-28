//
//  HomeScreen.swift
//  COESampleAppUITests
//
//  Created by Irshad Ahmad on 28/11/23.
//

import XCTest

final class HomeScreen: XCTestCase {
    private let homeLabel: XCUIElement = XCUIApplication().staticTexts["Home"]
    
    func testVisiblityOfScreen() {
        guard homeLabel.waitForExistence(timeout: 2.0) else {
            return XCTFail("Home screen is not present")
        }
    }
}


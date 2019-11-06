//
//  LoginViewControllerUITest.swift
//  iOSArchitecture_MVVMUITests
//
//  Created by shivani Bajaj on 9/25/19.
//  Copyright © 2019 Surjeet Singh. All rights reserved.
//

import XCTest
@testable import iOSArchitecture_MVVM

class LoginViewControllerUITest: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    override func tearDown() {
    }
    func testLoginButtonEnabled() {
        let app = XCUIApplication()
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("shivani@gmail.com")
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        app.secureTextFields["Password"].typeText("123456")
        XCTAssert(app.buttons["Login"].isEnabled, "Login Button is enabled")
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("shivani@gmail")
        passwordSecureTextField.tap()
        app.secureTextFields["Password"].typeText("123456")
        XCTAssert(!app.buttons["Login"].isEnabled, "Login Button is disabled")
    }
}

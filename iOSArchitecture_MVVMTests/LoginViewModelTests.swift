//
//  LoginViewModelTests.swift
//  iOSArchitecture_MVVM
//
//  Created by shivani Bajaj on 9/20/19.
//  Copyright © 2019 Surjeet Singh. All rights reserved.
//

import XCTest
@testable import iOSArchitecture_MVVM

class LoginViewModelTests: XCTestCase {

    // MARK: Variables
    var loginViewModel: LoginViewModel!
    override func setUp() {
        super.setUp()
        let userServiceMock = UserServiceMock(shouldReturnError: false)
        loginViewModel = LoginViewModel(userService: userServiceMock)
    }

    override func tearDown() {
        loginViewModel = nil
        super.tearDown()
    }
    func testLoginValidation() {
        var validTuple = loginViewModel.isValid(email: "xyz@gmail.com", password: "123456")
        XCTAssertTrue(validTuple.isValid, "Login Validated")
        validTuple = loginViewModel.isValid(email: "xyz@gmail", password: "123456")
        XCTAssertFalse(validTuple.isValid, validTuple.error ?? "")
        validTuple = loginViewModel.isValid(email: "xyz@gmail.com", password: "12345")
        XCTAssertFalse(validTuple.isValid, validTuple.error ?? "")
        validTuple = loginViewModel.isValid(email: "gmail.com", password: "12345")
        XCTAssertFalse(validTuple.isValid, validTuple.error ?? "")
    }
    func testLoginApi() {
        let email = "xyz@gmail.com"
        let password = "123456"
        loginViewModel.loginApi(email, password: password)
        if let success = loginViewModel.isSuccess {
            XCTAssert(success, "Api result \(success)")
        }
    }
}

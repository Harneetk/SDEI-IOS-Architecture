//
//  LoginViewModelMocks.swift
//  iOSArchitecture_MVVMTests
//
//  Created by shivani Bajaj on 9/24/19.
//  Copyright © 2019 Surjeet Singh. All rights reserved.
//

import Foundation
@testable import iOSArchitecture_MVVM

class UserServiceMock {
    // MARK: Variables
    var shouldReturnError = false
    var loginWasCalled = false
    enum MockServiceError: Error {
        case login
    }
    let mockLoginResponse: [String: Any] = [:]
    // MARK: Initialization
    convenience init() {
        self.init(shouldReturnError: false)
    }
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    // MARK: Helpers
    func reset() {
        shouldReturnError = false
        loginWasCalled = false
    }
}

extension UserServiceMock: UserServiceProtocol {
    func doLogin(email: String, password: String, completion: @escaping (Result<Any>) -> Void) {
        loginWasCalled = true
        if shouldReturnError {
            completion(.error(MockServiceError.login.localizedDescription))
        } else {
            completion(.success(mockLoginResponse))
        }
    }
}

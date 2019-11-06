//
//  BaseViewModel.swift
//  eLock
//
//  Created by Surjeet on 19/01/18.
//  Copyright © 2018 Surjeet. All rights reserved.
//

import UIKit

enum AlertType {
    case normal
    case warning
    case error
    case success
    case custom
}

class BaseViewModel: NSObject {

    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?(.success)
        }
    }
    
    var errorMessage: String? {
        didSet {
            self.showAlertClosure?(.error)
        }
    }
    
    var isSuccess:Bool? {
        didSet {
            if isSuccess ?? false {
                self.redirectControllerClosure?()
            }
        }
    }
    
    var isFailed:Bool? {
        didSet {
            self.showAlertClosure?(.error)
        }
    }
    
    var showAlertClosure: ((_ type: AlertType)->Void)?
    var updateLoadingStatus: (()->Void)?
    var reloadListViewClosure: (()->Void)?
    var redirectControllerClosure: (()->Void)?
    
}

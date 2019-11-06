//
//  UIAlertController.swift
//
//  Created by Surjeet Singh
//  Copyright © 2018 Surjeet. All rights reserved.
//

import Foundation
import UIKit

enum AlertAction:String {
    case okk
    case cancel
    case delete
    case yes
    case noo
    case setting
    
    var title:String {
        switch self {
        case .setting:
            return "Settings"
        default:
            return self.rawValue
        }
    }
    
    var style:UIAlertAction.Style {
        switch self {
        case .cancel:
            return .cancel
        case .delete:
            return .destructive
        default:
            return .default
        }
    }
}

enum AlertInputType:Int {
    case normal
    case email
    case password
}

typealias AlertHandler = (_ action:AlertAction) -> Void
typealias AlertUI = (title:String?, message:String?)

extension UIAlertController {
    
    class func showAlert(_ alert:AlertUI) {
        self.showAlert(alert, sender: nil, actions: .okk, handler: nil)
    }
    
    class func showAlert(_ alert:AlertUI, sender: AnyObject?, actions:AlertAction..., handler:AlertHandler?) {
        let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.darkGray
        for arg in actions {
            let action = UIAlertAction(title: arg.title, style: arg.style, handler: { (_) in
                handler?(arg)
            })
            alertController.addAction(action)
        }
        if let presenter = alertController.popoverPresentationController {
            presenter.sourceView = UIApplication.topViewController()?.view;
            presenter.permittedArrowDirections = .any
            presenter.sourceRect = sender?.bounds ?? .zero
        }
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    class func showActionSheet(_ alert:AlertUI, sender: AnyObject?, actions:AlertAction..., handler:AlertHandler?) {
        let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: .actionSheet)
           alertController.view.tintColor = UIColor.darkGray
           for arg in actions {
               let action = UIAlertAction(title: arg.title, style: arg.style, handler: { (_) in
                   handler?(arg)
               })
               alertController.addAction(action)
           }
           if let presenter = alertController.popoverPresentationController {
               presenter.sourceView = UIApplication.topViewController()?.view;
               presenter.permittedArrowDirections = .any
               presenter.sourceRect = sender?.bounds ?? .zero
           }
           UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    class func showInputAlert(_ alert:AlertUI, inputPlaceholders:[String]?, sender: AnyObject?, actions:AlertAction..., handler:AlertHandler?) {
        let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.darkGray
        for placeholder in inputPlaceholders ?? [] {
            alertController.addTextField(configurationHandler: { (txtField) in
                txtField.placeholder = placeholder
            })
        }
        for arg in actions {
            let action = UIAlertAction(title: arg.title, style: arg.style, handler: { (_) in
                handler?(arg)
            })
            alertController.addAction(action)
        }
        if let presenter = alertController.popoverPresentationController {
            presenter.sourceView = UIApplication.topViewController()?.view
            presenter.permittedArrowDirections = .any
            presenter.sourceRect =  sender?.bounds ?? .zero
        }
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
}



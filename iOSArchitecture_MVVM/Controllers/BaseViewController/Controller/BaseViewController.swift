//
//  BaseViewController.swift
//  FantomLED
//
//  Created by Surjeet Singh on 01/06/18.
//  Copyright © 2018 Surjeet Singh. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var baseVwModel: BaseViewModel? {
        didSet {
            initBaseModel()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideBackButton() {
        self.navigationItem.hidesBackButton = true
    }
    
    func hideNavigationBar(_ hide: Bool, animated: Bool = true) {
        self.navigationController?.setNavigationBarHidden(hide, animated: animated)
    }
    
    // Cann't be override by subclass
    final func initBaseModel() {
        // Native binding
        baseVwModel?.showAlertClosure = { [weak self] (_ type:AlertType) in
            DispatchQueue.main.async {
                if type == .success, let message = self?.baseVwModel?.alertMessage  {
//                    Helper.showNotificationAlert(nil, message, type)
                    let configAlert : AlertUI = ("", message)
                    UIAlertController.showAlert(configAlert)
                } else {
                    let message = self?.baseVwModel?.errorMessage ?? "Some Error occured"
//                    Helper.showNotificationAlert(nil, message , type)
                    let configAlert : AlertUI = ("", message)
                    UIAlertController.showAlert(configAlert)
                }
            }
        }
            
        baseVwModel?.updateLoadingStatus = { [weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.baseVwModel?.isLoading ?? false
                UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
            }
        }
    }
    
}


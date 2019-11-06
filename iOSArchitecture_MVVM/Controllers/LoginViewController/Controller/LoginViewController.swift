//
//  LoginViewController.swift
//  iOSArchitecture_MVVM
//
//  Created by Surjeet Singh on 14/03/2019.
//  Copyright © 2019 Surjeet Singh. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    // MARK: Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: Variables
    lazy var viewModel: LoginViewModel = {
        let obj = LoginViewModel(userService: UserService())
        self.baseVwModel = obj
        return obj
    }()
    
    private struct TextFieldTags {
        static let emailTextField = 100
        static let passwordTextField = 101
    }
    
    var isLoginEnabled: Bool {
        get {
          return loginButton.isUserInteractionEnabled
        }
        set {
            if newValue {
                loginButton.isUserInteractionEnabled = true
                loginButton.backgroundColor = UIColor.red
            } else {
                loginButton.isUserInteractionEnabled = false
                loginButton.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    // MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoginEnabled = false
        setupClosures()
    }
    
    // MARK: Setup
    func setupClosures() {
        viewModel.redirectControllerClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.navigateToHomeScreen()
            }
        }
    }
    
    func navigateToHomeScreen() {
        let coontroller = self.storyboard?.instantiateViewController(withIdentifier: HomeViewController.className) as! HomeViewController
        self.navigationController?.pushViewController(coontroller, animated: true)
    }
    
    // MARK: Button Actions
    @IBAction func onLoginClick(_ sender: UIButton) {
        viewModel.login(withEmail: emailTextField.text, password: passwordTextField.text)
    }
}

// MARK: TextField Delegate Methods

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard var email = emailTextField.text, var password = passwordTextField.text else { return true }
        switch textField.tag {
        case TextFieldTags.emailTextField:
            if string == "" {
                email.removeLast()
            } else {
                email.append(string)
            }
        case TextFieldTags.passwordTextField:
            if string == "" {
                password.removeLast()
            } else {
                password.append(string)
            }
        default:
            break
        }
        let validity = viewModel.isValid(email: email, password: password)
        isLoginEnabled = validity.isValid
        return true
    }
}

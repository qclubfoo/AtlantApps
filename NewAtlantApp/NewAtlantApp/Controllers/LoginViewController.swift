//
//  LoginViewController.swift
//  NewAtlantApp
//
//  Created by admin on 25/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import LocalAuthentication


class LoginViewController: UIViewController {
    
    @IBOutlet var loginView: LoginView!
    var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
          self,
          selector: #selector(keyboardDidShow(notification:)),
          name: UIResponder.keyboardDidShowNotification,
          object: nil)

        NotificationCenter.default.addObserver(
          self,
          selector: #selector(keyboardWillHide(_:)),
          name: UIResponder.keyboardWillHideNotification,
          object: nil)
        
        setupButton(loginView.loginButton)
        setupButton(loginView.touchIdButton)
    }
    
    
    @IBAction func touchIdLogin(_ sender: Any) {
        print("touch this")
        biometricalLogin()
    }
    @IBAction func loginButton(_ sender: UIButton) {

        guard let login = loginView.loginTextField.text,
            let password = loginView.passwordTextField.text else { return }
        if login == "test" && password == "test" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(identifier: "tabBarController") as TabBarViewController
            tabBarController.modalPresentationStyle = .fullScreen
            present(tabBarController, animated: true)
        } else {
            let alert = UIAlertController(title: "Incorrect login and/or password", message: "Try again", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        biometricalLogin()
    }
    
    func biometricalLogin() {
        let context = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please authenticate to proceed.") { (success, error) in
                if success {
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let tabBarController = storyboard.instantiateViewController(identifier: "tabBarController") as TabBarViewController
                        tabBarController.modalPresentationStyle = .fullScreen
                        self.present(tabBarController, animated: true)
                    }
                } else {
                    guard let error = error else { return }
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardDidShow(notification: Notification) {
        if loginView.frame.origin.y >= 0 {
            guard let info = notification.userInfo as NSDictionary?,
                let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
                let currentTextField = activeTextField
                else { return }
            
            let keyboardY = loginView.frame.size.height - keyboardSize.height
            let editingTextFieldY = currentTextField.frame.origin.y
            if editingTextFieldY + currentTextField.frame.height > keyboardY {
                UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
                    self.loginView.frame = CGRect(x: 0, y: self.loginView.frame.minY - (editingTextFieldY + currentTextField.frame.height + 10 - keyboardY), width: self.loginView.bounds.width, height: self.loginView.bounds.height)
                    
                })
            }
        }
    }
    
    @objc func keyboardWillHide(_: Notification) {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut, animations: {
            self.loginView.frame = CGRect(x: 0, y: 0, width: self.loginView.bounds.width, height: self.loginView.bounds.height)
        })
    }
    @IBAction func screenTapped(_ sender: Any) {
        loginView.endEditing(true)
    }
    
    private func setupButton(_ button: UIButton) {
        if button == loginView.loginButton {
            button.layer.cornerRadius = 10
        } else {
            if LAContext().biometricType == .faceID {
                let image = UIImage(named: "faceID")
                loginView.touchIdButton.contentMode = .scaleAspectFit
                loginView.touchIdButton.setImage(image, for: .normal)
                button.layer.cornerRadius = 10
            } else {
                loginView.touchIdButton.setImage(UIImage(named: "touchID"), for: .normal)
                button.layer.cornerRadius = 16.5
            }
        }
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginView.loginTextField {
            loginView.passwordTextField.becomeFirstResponder()
            textField.resignFirstResponder()
        } else {
            textField.resignFirstResponder()
            loginButton(loginView.loginButton)
        }
        return true
    }
}

extension LAContext {
    enum BiometricType: String {
        case none
        case touchID
        case faceID
    }

    var biometricType: BiometricType {
        var error: NSError?

        guard self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            // Capture these recoverable error thru Crashlytics
            return .none
        }

        if #available(iOS 11.0, *) {
            switch self.biometryType {
            case .none:
                return .none
            case .touchID:
                return .touchID
            case .faceID:
                return .faceID
            }
        } else {
            return  self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) ? .touchID : .none
        }
    }
}

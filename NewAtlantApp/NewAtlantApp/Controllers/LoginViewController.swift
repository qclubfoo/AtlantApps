//
//  LoginViewController.swift
//  NewAtlantApp
//
//  Created by admin on 25/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
//import NotificationCenter

class LoginViewController: UIViewController {
    
    @IBOutlet var loginView: LoginView!
    var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton(loginView.loginButton)

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
        button.layer.cornerRadius = 10
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

//
//  LoginViewController.swift
//  NewAtlantApp
//
//  Created by admin on 25/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var loginView: LoginView! {
        guard isViewLoaded else { return nil }
        return (view as! LoginView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton(loginView.loginButton)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func setupButton(_ button: UIButton) {
        button.layer.cornerRadius = 10
    }

}

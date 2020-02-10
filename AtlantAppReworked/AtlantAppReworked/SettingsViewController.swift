//
//  SettingsViewController.swift
//  AtlantAppReworked
//
//  Created by Дмитрий on 08.02.2020.
//  Copyright © 2020 Дмитрий. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton(button: emailButton)
        setupButton(button: callButton)

        // Do any additional setup after loading the view.
    }
    @IBAction func emailButtonTaped(_ sender: Any) {
        let alert = UIAlertController(title: "Send email to us", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: { textField in
        textField.placeholder = "Input your message here"
        })
        
        let sendAction = UIAlertAction(title: "Send email", style: .default, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(sendAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
        
    }
    @IBAction func callButtonTaped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Call to us", message: nil, preferredStyle: .alert)
        let sendAction = UIAlertAction(title: "Call", style: .default, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(sendAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
    func setupButton(button: UIButton) {
        button.layer.cornerRadius = 10
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

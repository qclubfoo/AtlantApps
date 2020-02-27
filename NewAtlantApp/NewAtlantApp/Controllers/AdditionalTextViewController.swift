//
//  AdditionalTextViewController.swift
//  NewAtlantApp
//
//  Created by admin on 25/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class AdditionalTextViewController: UIViewController {
    
    public var textForShow: String?
    
    @IBOutlet var additionalTextView: AdditionalTextView!
    //    public var additionalTextView: AdditionalTextView! {
//        guard isViewLoaded else { return nil }
//        return (view as! AdditionalTextView)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let textViewText = textForShow else { return }
        setupTextView(textView: additionalTextView.textView, textViewText)
        
        // Do any additional setup after loading the view.
    }
    
    private func setupTextView(textView: UITextView, _ text: String) {
        textView.textAlignment = .justified
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.text = text
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

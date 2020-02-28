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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let textViewText = textForShow else { return }
        setupTextView(textView: additionalTextView.textView, textViewText)
    }
    
    private func setupTextView(textView: UITextView, _ text: String) {
        textView.textAlignment = .justified
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.text = text
        textView.backgroundColor = UIColor(red: 255/255, green: 222/255, blue: 0/255, alpha: 0.75)
        textView.layer.cornerRadius = 10
    }

}

//
//  ViewController.swift
//  AtlantApp
//
//  Created by Дмитрий on 07.02.2020.
//  Copyright © 2020 Дмитрий. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cityArray: [String] = ["Sochi", "Saint Pitersburg", "Rostov", "Lipeck", "Saratov"]
    
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var cityPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityPicker.delegate = self
        cityPicker.dataSource = self
        cityPicker.selectRow(cityArray.count / 2, inComponent: 0, animated: true)
        
        chooseButton.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        cityArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 35
    }
    
}

extension ViewController: UIPickerViewDelegate {
    
}

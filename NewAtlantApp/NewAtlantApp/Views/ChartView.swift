//
//  ChartView.swift
//  NewAtlantApp
//
//  Created by admin on 21/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import Charts

public class ChartView: UIView {
    
    @IBOutlet weak var yearPicker: UIPickerView!
    @IBOutlet weak var metrickPicker: UIPickerView!
    @IBOutlet weak var choseButton: UIButton!
    @IBOutlet weak var combinedChartView: CombinedChartView!
}

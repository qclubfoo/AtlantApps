//
//  Charts.swift
//  AtlantAppReworked
//
//  Created by admin on 18/02/2020.
//  Copyright © 2020 Дмитрий. All rights reserved.
//

import Foundation
import UIKit
import Charts


class ChartViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var chartView: CombinedChartView!
    
    let months = ["Jan", "Feb", "Mar",
    "Apr", "May", "Jun",
    "Jul", "Aug", "Sep",
    "Oct", "Nov", "Dec"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false
        
        chartView.drawBarShadowEnabled = false
        chartView.highlightFullBarEnabled = false
        
        chartView.drawOrder = [
            DrawOrder.bar.rawValue,
            //        DrawOrder.bubble.rawValue,
            //        DrawOrder.candle.rawValue,
            DrawOrder.line.rawValue,
            //        DrawOrder.scatter.rawValue
        ]
        
        let l = chartView.legend
                l.wordWrapEnabled = true
                l.horizontalAlignment = .center
                l.verticalAlignment = .bottom
                l.orientation = .horizontal
                l.drawInside = false
        //        chartView.legend = l

                let rightAxis = chartView.rightAxis
                rightAxis.axisMinimum = 0
                
                let leftAxis = chartView.leftAxis
                leftAxis.axisMinimum = 0
                
                let xAxis = chartView.xAxis
                xAxis.labelPosition = .bothSided
                xAxis.axisMinimum = 0
                xAxis.granularity = 1
//                xAxis.valueFormatter = self
//                
//                self.updateChartData()
    }
}





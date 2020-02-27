//
//  ViewController.swift
//  NewAtlantApp
//
//  Created by admin on 19/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import Charts

class ChartsViewController: UIViewController {

    public var allMetricks = MetricksGroup()
    public var years = ["2019", "2020", "2021"]
    
    @IBOutlet var chartView: ChartView!
    //    public var chartView: ChartView! {
//        guard isViewLoaded else { return nil }
//        return (view as! ChartView)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMetrickPicker(picker: chartView.metrickPicker)
        setupYearPicker(picker: chartView.yearPicker)
        setupButton(button: chartView.choseButton)
        setupCombinedChart(chart: chartView.combinedChartView)
        
        
        // Do any additional setup after loading the view.
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            tabBarController?.tabBar.isHidden = true
        } else {
            tabBarController?.tabBar.isHidden = false
        }
    }
    
    
    @IBAction func showButton(_ sender: Any) {
        let barIndex = chartView.metrickPicker.selectedRow(inComponent: 0)
        let lineIndex = chartView.metrickPicker.selectedRow(inComponent: 1)
        combinedChartUpdate(barEntries: getNewBarChartValues(from: allMetricks.metricks[barIndex]),
        lineEntries: getNewLineChartValues(from: allMetricks.metricks[lineIndex]))
    }
    
    public func setupButton(button: UIButton) {
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 255/255, green: 221/255, blue: 45/255, alpha: 1)
        button.setTitleColor(UIColor(red: 48/255, green: 48/255, blue: 56/255, alpha: 1), for: .normal)
        button.setTitle("Отобразить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
    }
   
    private func setupYearPicker(picker: UIPickerView) {
//        picker.isHidden = true
    }

    private func setupMetrickPicker(picker: UIPickerView) {
        picker.dataSource = self
        picker.delegate = self
        picker.tintColor = UIColor(red: 48/255, green: 48/255, blue: 56/255, alpha: 1)
        picker.selectRow(0, inComponent: 0, animated: false)
        picker.selectRow(allMetricks.metricks.count - 1, inComponent: 1, animated: false)
    }
    
    private func setupCombinedChart(chart: CombinedChartView) {
        
        chart.delegate = self
        
        let l = chart.legend
        l.wordWrapEnabled = true
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        
        let rightAxis = chart.rightAxis
        rightAxis.enabled = false
        
        let leftAxis = chart.leftAxis
        leftAxis.axisMinimum = 0
        leftAxis.drawGridLinesEnabled = false
        
        let xAxis = chart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.axisMinimum = 0
        xAxis.granularity = 1
        xAxis.valueFormatter = self
        xAxis.labelRotationAngle = -45
        xAxis.avoidFirstLastClippingEnabled = true
        xAxis.labelCount = 12           // исправить
        xAxis.drawGridLinesEnabled = false
        
        combinedChartUpdate(barEntries: getNewBarChartValues(from: allMetricks.metricks.first!),
                            lineEntries: getNewLineChartValues(from: allMetricks.metricks.last!))
    }
    
    func getNewBarChartValues(from metrick: Metrick) -> [BarChartDataEntry] {
        var barEntries: [BarChartDataEntry] = []
        for i in 0 ..< metrick.data.count {
            let newEntry = BarChartDataEntry(x: Double(i), y: metrick.data[i].value)
            barEntries.append(newEntry)
        }
        return barEntries
    }
    
    func getNewLineChartValues(from metrick: Metrick) -> [ChartDataEntry] {
        var lineEntries: [ChartDataEntry] = []
        for i in 0 ..< metrick.data.count {
            let lineEntry = ChartDataEntry(x: Double(i), y: metrick.data[i].value)
            lineEntries.append(lineEntry)
        }
        return lineEntries
    }
    
    func combinedChartUpdate(barEntries: [BarChartDataEntry], lineEntries: [ChartDataEntry]) {
        guard let combinedChartView = chartView.combinedChartView else { return }
        let barPickerValue = chartView.metrickPicker.selectedRow(inComponent: 0)
        let linePickerValue = chartView.metrickPicker.selectedRow(inComponent: 1)
        let barDataSet = BarChartDataSet(entries: barEntries, label: allMetricks.metricks[barPickerValue].name)
        let lineDataSet = LineChartDataSet(entries: lineEntries, label: allMetricks.metricks[linePickerValue].name)
        
        setupLineDataSet(lineDataSet)
        setupBarDataSet(barDataSet)
        
        let data = CombinedChartData()
        data.barData = BarChartData(dataSets: [barDataSet])
        data.lineData = LineChartData(dataSets: [lineDataSet])
        
        combinedChartView.xAxis.axisMaximum = data.xMax + 1
        combinedChartView.xAxis.axisMinimum = data.xMin - 1
        
        let barWidth = 0.45 // x2 dataset
        data.barData.barWidth = barWidth
 
        combinedChartView.data = data
        combinedChartView.notifyDataSetChanged()
    }
    
    func setupLineDataSet(_ lineDataSet: LineChartDataSet) {
        lineDataSet.mode = .horizontalBezier
        lineDataSet.circleHoleRadius = 0
        lineDataSet.circleRadius = 5
        lineDataSet.lineWidth = 3
        lineDataSet.colors = [UIColor.systemYellow]
        lineDataSet.circleColors = [UIColor.systemYellow]
        lineDataSet.valueFont = .systemFont(ofSize: 8, weight: .bold)
        lineDataSet.axisDependency = .left
        lineDataSet.valueFormatter = self
    }
    
    func setupBarDataSet(_ barDataSet: BarChartDataSet) {
        barDataSet.colors = [UIColor.systemGreen]
        barDataSet.valueTextColor = .black
        barDataSet.valueFormatter = self
        barDataSet.valueFont = .systemFont(ofSize: 8, weight: .bold)
        barDataSet.axisDependency = .left
    }
    
    @objc func canRotate() -> Void {}
}

extension ChartsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == chartView.metrickPicker {
            return 2
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == chartView.metrickPicker {
            return allMetricks.metricks.count
        } else {
            return years.count
        }
    }
}

extension ChartsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == chartView.metrickPicker {
            return allMetricks.metricks[row].name
        } else {
            return years[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == chartView.metrickPicker {
            //        guard let picker = chartView.metrickPicker else { return }
            let first = pickerView.selectedRow(inComponent: 0)
            let second = pickerView.selectedRow(inComponent: 1)
            let lastNum = allMetricks.metricks.count - 1
            
            if first >= second {
                if first == lastNum {
                    pickerView.selectRow(first, inComponent: 1, animated: true)
                } else {
                    pickerView.selectRow(first + 1, inComponent: 1, animated: true)
                }
            }
        }
    }
}

extension ChartsViewController: ChartViewDelegate {
    
}
    
extension ChartsViewController: IValueFormatter {
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return String(Int(value))
    }
}

extension ChartsViewController: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let xAxisArray = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Dec"]
        if value < 0 || Int(value) >= xAxisArray.count { return "" }
        return xAxisArray[Int(value) % xAxisArray.count]
    }
}

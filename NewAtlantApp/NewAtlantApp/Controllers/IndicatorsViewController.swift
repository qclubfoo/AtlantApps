//
//  IndicatorsViewController.swift
//  NewAtlantApp
//
//  Created by admin on 27/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit



class IndicatorsViewController: UIViewController {
    
    let data = IndicatorsData()

    override func viewDidLoad() {
        super.viewDidLoad()

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
}

extension IndicatorsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.monthes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.monthes[section].indicators.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.numberStyle = .decimal
        let number = data.monthes[indexPath.section].indicators[indexPath.row].value
        let formatedStirng: String = formatter.string(for: number) ?? "123456789"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "indicatorString") as? IndicatorCell else { return UITableViewCell() }
        cell.indicatorName.text = data.monthes[indexPath.section].indicators[indexPath.row].name
        cell.indicatorValue.text = formatedStirng + " руб."
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(data.monthes[section].year) \(data.monthes[section].month)"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor(red: 255/255, green: 221/255, blue: 45/255, alpha: 1)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor(red: 48/255, green: 48/255, blue: 56/255, alpha: 1)
    }
    
}

extension IndicatorsViewController: UITableViewDelegate {

}

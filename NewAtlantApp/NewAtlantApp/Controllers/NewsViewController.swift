//
//  NewsViewController.swift
//  NewAtlantApp
//
//  Created by admin on 21/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var groupOfNews = GroupOfNews()
    
    @IBOutlet var newsView: NewsView!
    //    public var newsView: NewsView! {
//        guard isViewLoaded else { return nil }
//        return (view as! NewsView)
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        newsView.tableView.dataSource = self
        newsView.tableView.delegate = self
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

extension NewsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        groupOfNews.news.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groupOfNews.news[section].newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let text = groupOfNews.news[indexPath.section].newsItems[indexPath.row].newsTitle
        let additionalText = groupOfNews.news[indexPath.section].newsItems[indexPath.row].additionalText
        let cell: UITableViewCell
        
        cell = getCell(withText: text, withAddtitionalText: additionalText, inTableView: tableView)
        return cell
    }
    
    func getCell(withText text: String, withAddtitionalText additionalText: String?, inTableView tableView: UITableView) -> UITableViewCell {
        if additionalText != nil {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellWithExtraText") else { return UITableViewCell() }
            cell.detailTextLabel?.text = "Нажмите на ячейку для дополнительной информации"
            cell.textLabel?.text = text
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellWithoutExtraText") as? CellWithoutExtraText else { return UITableViewCell() }
            cell.label.text = text
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(groupOfNews.news[section].year) \(groupOfNews.news[section].month)"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor(red: 255/255, green: 221/255, blue: 45/255, alpha: 1)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor(red: 48/255, green: 48/255, blue: 56/255, alpha: 1)
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath)?.reuseIdentifier == "cellWithExtraText") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeViewController = storyboard.instantiateViewController(identifier: "AdditionalTextViewController") as AdditionalTextViewController
            homeViewController.textForShow = groupOfNews.news[indexPath.section].newsItems[indexPath.row].additionalText
            present(homeViewController, animated: true)
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

//
//  NewsViewController.swift
//  NewAtlantApp
//
//  Created by admin on 21/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class NewsClass {
    let month: String
    let news: [String]
    
    init(month: String, news: [String]) {
        self.month = month
        self.news = news
    }
}

class NewsViewController: UIViewController {
    
    var news: [NewsClass] {
       [
        NewsClass(month: "Январь 2020", news: ["Сделали много лидов", "Открыли Саратов"]),
        NewsClass(month: "Февраль 2020", news: ["Вышли на плановую прибыль", "Открыли Липецк"]),
        NewsClass(month: "Март 2020", news: ["Инвесотры получили первую прибыль", "Получили новый поток инвестиций"]),
        NewsClass(month: "Апрель 2020", news: ["Расширяемся огромными темпами"]),
        ]
    }
    
    public var newsView: NewsView! {
        guard isViewLoaded else { return nil }
        return (view as! NewsView)
    }
    

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
        news.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news[section].news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "newsCell")
        cell.textLabel?.text = news[indexPath.section].news[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return news[section].month
    }
}

extension NewsViewController: UITableViewDelegate {

}

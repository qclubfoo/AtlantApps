//
//  NewsOfPeriod.swift
//  NewAtlantApp
//
//  Created by admin on 25/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class NewsOfPeriod {
    let year: Int
    let month: String
    var newsItems: [NewsItem]
    
    init(year: Int, month: String) {
        self.year = year
        self.month = month
        newsItems = []
    }
    
    convenience init(year: Int, month: String, newsItems: [NewsItem]) {
        self.init(year: year, month: month)
        self.newsItems = newsItems
    }
}

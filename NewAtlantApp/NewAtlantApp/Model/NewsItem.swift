//
//  NewsItem.swift
//  NewAtlantApp
//
//  Created by admin on 25/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class NewsItem {
    var newsTitle: String
    var additionalText: String?
    
    init(newsTitle: String) {
        self.newsTitle = newsTitle
        additionalText = nil
    }
    
    convenience init(newsTitle: String, additionalText: String) {
        self.init(newsTitle: newsTitle)
        self.additionalText = additionalText
    }
}

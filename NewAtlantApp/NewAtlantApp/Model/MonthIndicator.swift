//
//  MonthIndicator.swift
//  NewAtlantApp
//
//  Created by admin on 27/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class MonthIndicator {
    var month: String
    var year: Int
    var indicators: [Indicator]
    
    init(month: String, indicators: [Indicator]) {
        self.month = month
        year = 2020
        self.indicators = indicators
    }
}

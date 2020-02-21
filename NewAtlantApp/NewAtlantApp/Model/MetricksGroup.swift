//
//  AllMetricks.swift
//  NewAtlantApp
//
//  Created by admin on 21/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

public class MetricksGroup {
    public let title: String = "All metricks"
    public var metricks: [Metrick] {
        
        return [leads(), records(), meetings(), contracts()]
    }
}

extension MetricksGroup {
    
    public func leads() -> Metrick {
        
        let metrickData: [MetrickData] = [
        MetrickData(month: "Jan", year: 2020, value: 100),
        MetrickData(month: "Feb", year: 2020, value: 88),
        MetrickData(month: "Mar", year: 2020, value: 99),
        MetrickData(month: "Apr", year: 2020, value: 89),
        MetrickData(month: "May", year: 2020, value: 98),
        MetrickData(month: "Jun", year: 2020, value: 97),
        MetrickData(month: "Jul", year: 2020, value: 90),
        MetrickData(month: "Aug", year: 2020, value: 90),
        MetrickData(month: "Sep", year: 2020, value: 93),
        MetrickData(month: "Okt", year: 2020, value: 95),
        MetrickData(month: "Nov", year: 2020, value: 95),
        MetrickData(month: "Dec", year: 2020, value: 92)
        ]
        
        return Metrick(name: "Лиды", data: metrickData)
    }
    
    public func records() -> Metrick {
        
        let metrickData: [MetrickData] = [
        MetrickData(month: "Jan", year: 2020, value: 72),
        MetrickData(month: "Feb", year: 2020, value: 66),
        MetrickData(month: "Mar", year: 2020, value: 68),
        MetrickData(month: "Apr", year: 2020, value: 66),
        MetrickData(month: "May", year: 2020, value: 75),
        MetrickData(month: "Jun", year: 2020, value: 80),
        MetrickData(month: "Jul", year: 2020, value: 75),
        MetrickData(month: "Aug", year: 2020, value: 65),
        MetrickData(month: "Sep", year: 2020, value: 73),
        MetrickData(month: "Okt", year: 2020, value: 72),
        MetrickData(month: "Nov", year: 2020, value: 73),
        MetrickData(month: "Dec", year: 2020, value: 77)
        ]
        
        return Metrick(name: "Записи", data: metrickData)
    }
    
    public func meetings() -> Metrick {
        let metrickData: [MetrickData] = [
        MetrickData(month: "Jan", year: 2020, value: 53),
        MetrickData(month: "Feb", year: 2020, value: 51),
        MetrickData(month: "Mar", year: 2020, value: 51),
        MetrickData(month: "Apr", year: 2020, value: 58),
        MetrickData(month: "May", year: 2020, value: 48),
        MetrickData(month: "Jun", year: 2020, value: 49),
        MetrickData(month: "Jul", year: 2020, value: 53),
        MetrickData(month: "Aug", year: 2020, value: 51),
        MetrickData(month: "Sep", year: 2020, value: 51),
        MetrickData(month: "Okt", year: 2020, value: 45),
        MetrickData(month: "Nov", year: 2020, value: 46),
        MetrickData(month: "Dec", year: 2020, value: 45)
        ]
        
        return Metrick(name: "Встречи", data: metrickData)
    }
    
    public func contracts() -> Metrick {
        let metrickData: [MetrickData] = [
        MetrickData(month: "Jan", year: 2020, value: 31),
        MetrickData(month: "Feb", year: 2020, value: 20),
        MetrickData(month: "Mar", year: 2020, value: 28),
        MetrickData(month: "Apr", year: 2020, value: 19),
        MetrickData(month: "May", year: 2020, value: 32),
        MetrickData(month: "Jun", year: 2020, value: 24),
        MetrickData(month: "Jul", year: 2020, value: 24),
        MetrickData(month: "Aug", year: 2020, value: 24),
        MetrickData(month: "Sep", year: 2020, value: 26),
        MetrickData(month: "Okt", year: 2020, value: 28),
        MetrickData(month: "Nov", year: 2020, value: 15),
        MetrickData(month: "Dec", year: 2020, value: 18)
        ]
        
        return Metrick(name: "Договоры", data: metrickData)
    }
    
}

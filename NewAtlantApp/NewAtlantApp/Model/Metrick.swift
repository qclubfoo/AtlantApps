//
//  Metrick.swift
//  NewAtlantApp
//
//  Created by admin on 21/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

public class Metrick {
    public var name: String
    public var data: [MetrickData]
    
    init(name: String, data: [MetrickData]) {
        self.name = name
        self.data = data
    }
    
    convenience init(name: String) {
        self.init(name: "", data: [])
        self.name = name
    }
}

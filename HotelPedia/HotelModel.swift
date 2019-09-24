//
//  HotelModel.swift
//  HotelPedia
//
//  Created by Divyansh  Jain on 21/09/19.
//  Copyright © 2019 Divyansh  Jain. All rights reserved.
//

import Foundation

public class HotelModel {
    var name: String = ""
    var totalrooms: Int = 0
    var address: String = ""
    
    init(name: String, totalrooms: Int, address: String) {
        self.name = name
        self.totalrooms = totalrooms
        self.address = address
    }
}

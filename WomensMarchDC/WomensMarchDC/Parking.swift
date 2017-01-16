//
//  Parking.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/16/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation

class Parking {
    let name:String
    let street:String
    let latitude:Double
    let longitude:Double
    var openNow:Bool
    
    init(name:String, street:String, latitude:Double, longitude:Double, openNow:Bool) {
        self.name = name
        self.street = street
        self.latitude = latitude
        self.longitude = longitude
        self.openNow = false
    }
    
}

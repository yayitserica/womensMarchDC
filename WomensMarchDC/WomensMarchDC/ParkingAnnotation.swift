//
//  ParkingAnnotation.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/16/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class ParkingAnnotation: NSObject, MKAnnotation {
    var identifier: String = "Parking location"
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, subtitle: String, lat:CLLocationDegrees,long:CLLocationDegrees){
        self.title = title
        self.subtitle = subtitle
        coordinate = CLLocationCoordinate2DMake(lat, long)
    }
}

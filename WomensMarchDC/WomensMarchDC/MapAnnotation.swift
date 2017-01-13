//
//  MapAnnotation.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/13/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    //this is a custom getter
//    var mapPinDescription:String {
//        return "\(title): \(subtitle)"
//    }
    
    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

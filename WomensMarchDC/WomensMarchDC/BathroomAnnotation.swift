//
//  MapAnnotation.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/13/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class BathroomAnnotation: NSObject, MKAnnotation {
    var identifier: String = "Bathroom location"
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
//    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D, imageName: UIImage) {
//        self.title = title
//        self.subtitle = subtitle
//        self.coordinate = coordinate
//        self.imageName = imageName
//    }
        
    init(title:String, subtitle: String, lat:CLLocationDegrees,long:CLLocationDegrees){
        self.title = title
        self.subtitle = subtitle
        coordinate = CLLocationCoordinate2DMake(lat, long)
    }
}



//
//  MapViewController.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/12/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMapCenter()
        
        
    }
    
    func setMapCenter() {
        //region of the screen that the map is showing; this is a function that makes an object (like a factory)
        let marchLat:Double = 38.8877982
        let marchLong: Double = -77.0174687
        
        let marchCoordinate = CLLocationCoordinate2D(latitude: marchLat, longitude: marchLong)
        
        //how many meters do you want to display, how much of the map do you want to show
        let latitudinalMeters: CLLocationDistance = 1000
        let longitudinalMeters: CLLocationDistance = 1000
        let marchRegion = MKCoordinateRegionMakeWithDistance(marchCoordinate, latitudinalMeters, longitudinalMeters)
        mapView.setRegion(marchRegion, animated: true)
        
        //makes a pin for location
        let mapPin = MapAnnotation(title: "Women's March Meeting Point", subtitle: "Independence Ave. & Third St. SW", coordinate: marchCoordinate)
        mapView.addAnnotation(mapPin)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

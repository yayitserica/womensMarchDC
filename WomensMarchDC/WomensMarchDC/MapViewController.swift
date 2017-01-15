//
//  MapViewController.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/12/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit
import MapKit

class CustomPointAnnotation: MKPointAnnotation {
    var imageName: String!
}

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let store = DataStore.sharedInstance
    var gotBathrooms:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMapCenter()
       self.mapView.delegate = self
    }

    func getBathrooms() {
        store.createBathroomsArray {
            for bathroom in self.store.bathrooms {
                let bathCoord = CLLocationCoordinate2D(latitude: bathroom.latitude, longitude: bathroom.longitude)
                let bathPin = MapAnnotation(title: bathroom.name, subtitle: bathroom.street, coordinate: bathCoord, imageName: UIImage(named:"Toilet-48.png")!)
                OperationQueue.main.addOperation {
                    self.mapView.addAnnotation(bathPin)
                }
                self.gotBathrooms = true
            }
        }
    }
    
    func setMapCenter() {
        
        //region of the screen that the map is showing; this is a function that makes an object (like a factory)
        let marchCoordinate = CLLocationCoordinate2D(latitude: Constants.marchLat, longitude: Constants.marchLong)
        
        //how many meters do you want to display, how much of the map do you want to show
        let latitudinalMeters: CLLocationDistance = 1000
        let longitudinalMeters: CLLocationDistance = 1000
        let marchRegion = MKCoordinateRegionMakeWithDistance(marchCoordinate, latitudinalMeters, longitudinalMeters)
        self.mapView.setRegion(marchRegion, animated: true)
        
        //makes a pin for location
        let mapPin = MapAnnotation(title: "Women's March Meeting Point", subtitle: "Independence Ave. & Third St. SW", coordinate: marchCoordinate, imageName: UIImage(named:"Female-48.png")!)
        
        
        self.mapView.addAnnotation(mapPin)
        getBathrooms()
 
    }

//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//    
//        let annotationView = MKPinAnnotationView()
//        annotationView.pinTintColor = constants.navy
//        annotationView.image = UIImage(named: "Female-48.png")
//        if gotBathrooms {
//            annotationView.pinTintColor = constants.navy
//        }
//        
//        return annotationView
//    }

}

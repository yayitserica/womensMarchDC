//
//  MapViewController.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/12/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit
import MapKit

let marchCoordinate = CLLocationCoordinate2D(latitude: Constants.marchLat, longitude: Constants.marchLong)

class WomensMarchCoordinate: NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D = marchCoordinate
    var title: String? = "Women's March Meeting Point"
    var subtitle: String? = "Independence Ave. & Third St. SW"
}

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let store = DataStore.sharedInstance
    let constants = Constants()
    
    let mapSpanMeters: CLLocationDistance = 1610

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        setMapRegion()
        mapView.addAnnotation(WomensMarchCoordinate())
        getBathrooms()
        getParkingGarages()
    }
    
    func setMapRegion(){
        let region = MKCoordinateRegionMakeWithDistance(marchCoordinate, mapSpanMeters, mapSpanMeters)
        mapView.setRegion(region, animated: true)
    }

    func getBathrooms() {
        store.createBathroomsArray {
            for bathroom in self.store.bathrooms {
                let bathPin = BathroomAnnotation(title: bathroom.name, subtitle: bathroom.street, lat: bathroom.latitude, long: bathroom.longitude)
                OperationQueue.main.addOperation {
                    self.mapView.addAnnotation(bathPin)
                }
            }
        }
    }
    
    func getParkingGarages() {
        store.getParkingData { 
            print(self.store.parkingGarages.count)
            for parking in self.store.parkingGarages {
                let parkingPin = ParkingAnnotation(title: parking.name, subtitle: parking.street, lat: parking.latitude, long: parking.longitude)
                OperationQueue.main.addOperation {
                    self.mapView.addAnnotation(parkingPin)
                }
            }
        }
    }
    
    //This changes the color of the pin based on the pizza chain.
    func pinColor(name:String) -> UIColor{
        var color = UIColor.purple
        switch name{
        case "Women's March Meeting Point":
            color = self.constants.coral
        default:
            color = self.constants.navy
        }
        return color
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        if let unwrappedAnnotation = annotation as? BathroomAnnotation {
//            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: unwrappedAnnotation.identifier) as? MKPinAnnotationView {
                if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: unwrappedAnnotation.identifier) {
                return dequeuedView
            } else {
//                let view = MKPinAnnotationView(annotation: unwrappedAnnotation, reuseIdentifier: unwrappedAnnotation.identifier)
                let view = MKAnnotationView(annotation: unwrappedAnnotation, reuseIdentifier: unwrappedAnnotation.identifier)
//                let unwrappedTitle = unwrappedAnnotation.title ?? ""
                view.image = UIImage(named: "Toilet-48.png")
//                view.pinTintColor = pinColor(name: unwrappedTitle)
                view.isEnabled = true
                view.canShowCallout = true
                view.leftCalloutAccessoryView = UIImageView(image: UIImage(named: "Toilet-48.png"))
                return view
            }
        } else if let unwrappedAnnotation = annotation as? ParkingAnnotation {
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: unwrappedAnnotation.identifier) {
                return dequeuedView
            } else {
                let view = MKAnnotationView(annotation: unwrappedAnnotation, reuseIdentifier: unwrappedAnnotation.identifier)
                view.image = UIImage(named: "Parking-48.png")
                view.isEnabled = true
                view.canShowCallout = true
                view.leftCalloutAccessoryView = UIImageView(image: UIImage(named: "Parking-48.png"))
                return view
            }
        
        } else {
            if let unwrappedAnnotation = annotation as? WomensMarchCoordinate {
                if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: "center"){
//                if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: "center") as? MKPinAnnotationView {
                    return dequeuedView
                } else {
//                    let view = MKPinAnnotationView(annotation: unwrappedAnnotation, reuseIdentifier: "center")
//                    view.pinTintColor = constants.coral
                    let view = MKAnnotationView(annotation: unwrappedAnnotation, reuseIdentifier: "center")
                    view.image = UIImage(named: "Female-48.png")
                    view.isEnabled = true
                    view.canShowCallout = true
//                    view.leftCalloutAccessoryView = UIImageView(image: UIImage(named: "Female-48.png"))
                    return view
                }
            }
        }
        return nil
    }

}

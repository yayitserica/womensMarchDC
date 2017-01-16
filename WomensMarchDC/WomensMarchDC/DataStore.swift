//
//  DataStore.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/14/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation

class DataStore {
    static let sharedInstance = DataStore()
    private init() {}
    
    var bathrooms:[Bathroom] = []
    var parkingGarages:[Parking] = []
    
    func createBathroomsArray(completion:@escaping ()->Void) {
        self.bathrooms.removeAll()
        
        APIClient.getbathroomJSON { (bathroomsArray) in
            guard let unwrappedBathroomsArray = bathroomsArray else { return }
            for bathroom in unwrappedBathroomsArray {
                let name = bathroom["name"] as? String ?? ""
                let street = bathroom["street"] as? String ?? ""
                let latitude = bathroom["latitude"] as? Double ?? 0.00
                let longitude = bathroom["longitude"] as? Double ?? 0.00
                let bathroom = Bathroom(name: name, street: street, latitude: latitude, longitude: longitude)
                self.bathrooms.append(bathroom)
            }
            completion()
        }
    }
    
    func getWeatherData(completion:@escaping (String, Int)->Void) {
        APIClient.getWeatherJSON { (weatherDictionary) in
            let currentlyDict = weatherDictionary["currently"] as? [String:Any] ?? [:]
            let summary = currentlyDict["summary"] as? String ?? ""
            let temperature = currentlyDict["temperature"] as? Int ?? 0
            completion(summary, temperature)
        }
    }
    
    func getParkingData(completion:@escaping ()->Void) {
        self.parkingGarages.removeAll()
        APIClient.getParkingJSON { (parkingDictionary) in
            let resultsArray = parkingDictionary["results"] as? [[String:Any]] ?? []
            for location in resultsArray {
                let geometryKey = location["geometry"] as? [String:Any] ?? [:]
                let locationKey = geometryKey["location"] as? [String:Any] ?? [:]
                let parkingLat = locationKey["lat"] as? Double ?? 0.0
                let parkingLong = locationKey["lng"] as? Double ?? 0.0
                let nameKey = location["name"] as? String ?? ""
                let openingHoursKey = location["opening_hours"] as? [String:Any] ?? [:]
                let openNowKey = openingHoursKey["open_now"] as? Bool ?? false
                //if the parking garage is currently open, then add it to the parkingGarages array
                if openNowKey {
                    let vicinityKey = location["vicinity"] as? String ?? ""
                    let newParking = Parking(name: nameKey, street: vicinityKey, latitude: parkingLat, longitude: parkingLong, openNow: openNowKey)
                    self.parkingGarages.append(newParking)
                }
            }
            completion()
        }
    }
}

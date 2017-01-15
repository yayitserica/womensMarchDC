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
    
    func createBathroomsArray(completion:@escaping ()->Void) {
        
        self.bathrooms.removeAll()
        
        APIClient.getJSON { (bathroomsArray) in
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
}

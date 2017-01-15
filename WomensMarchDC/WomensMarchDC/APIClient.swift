//
//  APIClient.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/14/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation

class APIClient {
    class func getJSON(completion:@escaping ([[String:Any]]?)->Void) {
        let urlString = "http://www.refugerestrooms.org:80/api/v1/restrooms/by_location.json?lat=38.887590&lng=-77.015280"
        let url = URL(string: urlString)
        guard let unwrappedURL = url else { return }
        let session = URLSession.shared
        let datatask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            guard let unwrappedData = data else { return }
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String:Any]]
                print("getting json")
                completion(responseJSON)
            } catch {
                print("error getting bathroom JSON")
            }
        }
        datatask.resume()
    }
}

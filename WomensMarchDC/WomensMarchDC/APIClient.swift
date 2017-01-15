//
//  APIClient.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/14/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation

class APIClient {
    class func getbathroomJSON(completion:@escaping ([[String:Any]]?)->Void) {
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
    
    class func getWeatherJSON(completion:@escaping ([String:Any])->Void) {
        let urlString = "\(Secrets.apiURL)\(Secrets.apikey)\(Constants.marchLat),\(Constants.marchLong)"
        let url = URL(string: urlString)
        guard let unwrappedURL = url else { return }
        let session = URLSession.shared
        let datatask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            guard let unwrappedData = data else { return }
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String:Any] ?? [:]
                completion(responseJSON)
            } catch {
                print("error with weather JSON")
            }
        }
        datatask.resume()
    }
}

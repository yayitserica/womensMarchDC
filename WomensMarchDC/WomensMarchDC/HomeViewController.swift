//
//  ViewController.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/12/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
   
    let store = DataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatViews()
        getCurrentWeather()
    }

    func formatViews() {
        quoteLabel.adjustsFontSizeToFitWidth = true
    }
    
    func getCurrentWeather() {
        self.store.getWeatherData { (summary, temp) in
            <#code#>
        }
    }


}


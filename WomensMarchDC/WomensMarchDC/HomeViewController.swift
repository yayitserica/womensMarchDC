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
   
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
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
            print("summary is \(summary) and \(temp)")
            OperationQueue.main.addOperation {
                self.tempLabel.text = String(temp)
                self.summaryLabel.text = summary
            }
            
        }
    }


}


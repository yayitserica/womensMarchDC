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
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatViews()
        
    }

    func formatViews() {
        quoteLabel.adjustsFontSizeToFitWidth = true
    }
    
    func getRegisterPage() {
        guard URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSdzAOhSz5i7Vw88k9z7s5crNKsjmtoFigkb1jSuAQJ3-57uKg/viewform?c=0&w=1") != nil else { return }
        
    }


}


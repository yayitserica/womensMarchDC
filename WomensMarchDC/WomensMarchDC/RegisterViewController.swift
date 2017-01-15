//
//  RegisterViewController.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/12/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getRegisterPage()
        // Do any additional setup after loading the view.
    }

    func getRegisterPage() {
         let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSdzAOhSz5i7Vw88k9z7s5crNKsjmtoFigkb1jSuAQJ3-57uKg/viewform?c=0&w=1") ?? URL(string: "https://www.womensmarch.com/")
        DispatchQueue.main.async {
            self.webView.loadRequest(URLRequest(url: url!))

        }
        
     }


}

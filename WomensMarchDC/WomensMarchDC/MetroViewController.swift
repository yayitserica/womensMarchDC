//
//  MetroViewController.swift
//  WomensMarchDC
//
//  Created by Erica Millado on 1/15/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class MetroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets the max amount the image can zoom to
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        // Do any additional setup after loading the view.
    }

    //MARK: - scrollview delegate method
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}

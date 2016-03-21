//
//  DAFViewController.swift
//  CoreAnimationBehaviorDetails
//
//  Created by David Flores on 3/20/16.
//  Copyright © 2016 David Flores. All rights reserved.
//

import UIKit

class DAFViewController: UIViewController
{
    private var testLayer = CALayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.testLayer.backgroundColor = UIColor.blueColor().CGColor
        self.testLayer.frame = CGRectMake(0, 0, 100, 100)
        self.view.layer.addSublayer(self.testLayer)
    }
}

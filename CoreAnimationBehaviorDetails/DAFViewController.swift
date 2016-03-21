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
    @IBOutlet
    var beginCoreAnimationTestsButton: UIButton!
    
    private var testLayer = CALayer()
    private var testGenerator : Array<(DAFViewController -> () -> (), String)>.Generator?
    private var tests = [
        (DAFViewController.basicImplicitAnimationTest, "Basic Implicit Animation Test"),
        (DAFViewController.basicImplicitAnimationWithLongerDurationTest, "Basic Implicit Animation With Longer Duration Test"),
        (DAFViewController.basicImplicitAnimationWithLongerDurationPresentationLayerTest, "Basic Implicit Animation With Longer Duration Presentation Layer Test"),
        (DAFViewController.basicImplicitAnimationWithLongerDurationMultiplePresentationLayerTest, "Basic Implicit Animation With Longer Duration Multiple Presentation Layer Test")
    ]
    
    func basicImplicitAnimationTest()
    {
        print("Explicit animation duration: \(CATransaction.animationDuration())")
        
        print("Model layer starting position: \(self.testLayer.position)")
        
        self.testLayer.position = CGPoint(x: 50, y: 500)
        
        print("Model layer ending position: \(self.testLayer.position)")
    }

    func basicImplicitAnimationWithLongerDurationTest()
    {
        CATransaction.setAnimationDuration(5.0)

        print("Explicit animation duration: \(CATransaction.animationDuration())")
        
        print("Model layer starting position: \(self.testLayer.position)")
        
        self.testLayer.position = CGPoint(x: 50, y: 500)
        
        print("Model layer ending position: \(self.testLayer.position)")
    }
    
    func basicImplicitAnimationWithLongerDurationPresentationLayerTest()
    {
        CATransaction.begin()

        print("Explicit Transaction Begin")
        
        CATransaction.setAnimationDuration(5.0)
        
        print("Explicit animation duration: \(CATransaction.animationDuration())")
        
        print("Model layer starting position: \(self.testLayer.position)")
        
        self.testLayer.position = CGPoint(x: 50, y: 500)
        
        print("Model layer ending position: \(self.testLayer.position)")
        
        CATransaction.commit()
        
        print("Explicit Transaction Commit")
        
        print("Sleep for one second")
        
        sleep(1)
        
        if let presentationLayer = self.testLayer.presentationLayer()
        {
            print("Presentation layer position: \(presentationLayer.position)")
        }
    }
    
    func basicImplicitAnimationWithLongerDurationMultiplePresentationLayerTest()
    {
        CATransaction.begin()
        
        print("Explicit Transaction Begin")
        
        CATransaction.setAnimationDuration(5.0)
        
        print("Explicit animation duration: \(CATransaction.animationDuration())")
        
        print("Model layer starting position: \(self.testLayer.position)")
        
        self.testLayer.position = CGPoint(x: 50, y: 500)
        
        print("Model layer ending position: \(self.testLayer.position)")
        
        CATransaction.commit()
        
        print("Explicit Transaction Commit")
        
        print("Sleep for one second")
        
        sleep(1)
        
        if let presentationLayer = self.testLayer.presentationLayer()
        {
            print("Presentation layer position: \(presentationLayer.position)")
        }
     
        print("Sleep for one second")
        
        sleep(1)
        
        if let presentationLayer = self.testLayer.presentationLayer()
        {
            print("Presentation layer position: \(presentationLayer.position)")
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.testLayer.backgroundColor = UIColor.blueColor().CGColor
        self.testLayer.frame = CGRectMake(0, 0, 100, 100)
        self.view.layer.addSublayer(self.testLayer)
        
        self.resetTests()
    }
    
    @IBAction
    func didPressBeginCoreAnimationTestsButton(button: UIButton)
    {
        assert( button === self.beginCoreAnimationTestsButton )
        
        self.beginCoreAnimationTestsButton.hidden = true
        
        self.testLayer.hidden = false
        
        self.testGenerator = tests.generate()
        
        queueNextTest()
    }
    
    func resetTests()
    {
        self.testLayer.hidden = true
        
        self.beginCoreAnimationTestsButton.hidden = false
    }
    
    func resetTestLayerState()
    {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.testLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        CATransaction.commit()
    }
    
    func queueNextTest()
    {
        resetTestLayerState()
        
        dispatch_after(
            dispatch_time(DISPATCH_TIME_NOW, 2500000000),
            dispatch_get_main_queue())
            {
                self.runNextTest()
            }
    }
    
    func runNextTest()
    {
        guard let test = self.testGenerator?.next() else
        {
            self.resetTests()
            
            return
        }
       
        print("Starting \(test.1)")
        
        test.0(self)()
        
        dispatch_after(
            dispatch_time(DISPATCH_TIME_NOW, 7500000000),
            dispatch_get_main_queue())
            {
                print("Ending \(test.1)\n\n")
                
                self.queueNextTest()
            }
    }
}

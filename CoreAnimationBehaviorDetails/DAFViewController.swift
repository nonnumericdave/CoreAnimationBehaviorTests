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
        (basicImplicitAnimationTest,
            "Basic Implicit Animation Test"),
        (basicImplicitAnimationWithLongerDurationTest,
            "Basic Implicit Animation With Longer Duration Test"),
        (basicImplicitAnimationWithLongerDurationPresentationLayerTest,
            "Basic Implicit Animation With Longer Duration Presentation Layer Test"),
        (basicImplicitAnimationWithLongerDurationPresentationLayerLongerInitialSleepTest,
            "Basic Implicit Animation With Longer Duration Presentation Layer Longer Initial Sleep Test"),
        (basicImplicitAnimationWithLongerDurationMultiplePresentationLayerTest,
            "Basic Implicit Animation With Longer Duration Multiple Presentation Layer Test"),
        (basicImplicitAnimationWithLongerDurationMultiplePresentationLayerAndFlushTest,
            "Basic Implicit Animation With Longer Duration Multiple Presentation Layer and Flushes Test"),
        (basicExplicitAnimationTest,
            "Basic Explicit Animation Test"),
        (basicExplicitAnimationWithExplicitTransactionTest,
            "Basic Explicit Animation With Explicit Transaction Test"),
        (basicExplicitAnimationWithExplicitTransactionPresentationLayerTest,
            "Basic Explicit Animation With Explicit Transaction Presentation Layer Test"),
        (basicExplicitAnimationWithExplicitTransactionPresentationLayerLongerInitialSleepTest,
            "Basic Explicit Animation With Explicit Transaction Presentation Layer Longer Initial Sleep Test"),
        (basicExplicitAnimationWithExplicitTransactionMultiplePresentationLayerTest,
            "Basic Explicit Animation With Explicit Transaction Multiple Presentation Layer Test"),
        (basicExplicitAnimationWithExplicitTransactionMultiplePresentationLayerAndFlushTest,
            "Basic Explicit Animation With Explicit Transaction Multiple Presentation Layer and Flushes Test"),
        (basicExplicitAnimationImplicitValuesWithExplicitTransactionMultiplePresentationLayerAndFlushBrokenTest,
            "Basic Explicit Animation Implicit Values With Explicit Transaction Multiple Presentation Layer and Flushes Broken Test")
    ]
    
    func basicImplicitAnimationTest()
    {
        print("Implicit animation duration: \(CATransaction.animationDuration())")
        
        print("Implicit animation layer 'from' position: \(self.testLayer.position)")
        self.testLayer.position = CGPoint(x: 50, y: 500)
        print("Implicit animation layer 'to' position: \(self.testLayer.position)")
    }

    func basicImplicitAnimationWithLongerDurationTest()
    {
        CATransaction.setAnimationDuration(5.0)
        print("Explicit transaction animation duration: \(CATransaction.animationDuration())")
        
        print("Implicit animation layer 'from' position: \(self.testLayer.position)")
        self.testLayer.position = CGPoint(x: 50, y: 500)
        print("Implicit animation layer 'to' position: \(self.testLayer.position)")
    }
    
    func basicImplicitAnimationWithLongerDurationPresentationLayerTest()
    {
        CATransaction.begin()
        print("Explicit transaction begin")
        
        CATransaction.setAnimationDuration(5.0)
        print("Explicit transaction animation duration: \(CATransaction.animationDuration())")
        
        print("Implicit animation layer 'from' position: \(self.testLayer.position)")
        self.testLayer.position = CGPoint(x: 50, y: 500)
        print("Implicit animation layer 'to' position: \(self.testLayer.position)")
        
        CATransaction.commit()
        print("Explicit transaction commit")
        
        print("Sleep for one second")
        sleep(1)
        
        if let presentationLayer = self.testLayer.presentationLayer()
        {
            print("Presentation layer position: \(presentationLayer.position)")
        }
    }
    
    func basicImplicitAnimationWithLongerDurationPresentationLayerLongerInitialSleepTest()
    {
        CATransaction.begin()
        print("Explicit transaction begin")
        
        CATransaction.setAnimationDuration(5.0)
        print("Explicit transaction animation duration: \(CATransaction.animationDuration())")
        
        print("Implicit animation layer 'from' position: \(self.testLayer.position)")
        self.testLayer.position = CGPoint(x: 50, y: 500)
        print("Implicit animation layer 'to' position: \(self.testLayer.position)")
        
        CATransaction.commit()
        print("Explicit transaction commit")
        
        print("Sleep for two seconds")
        sleep(2)
        
        if let presentationLayer = self.testLayer.presentationLayer()
        {
            print("Presentation layer position: \(presentationLayer.position)")
        }
    }
    
    func basicImplicitAnimationWithLongerDurationMultiplePresentationLayerTest()
    {
        CATransaction.begin()
        print("Explicit transaction begin")
        
        CATransaction.setAnimationDuration(5.0)
        print("Explicit transaction animation duration: \(CATransaction.animationDuration())")
        
        print("Implicit animation layer 'from' position: \(self.testLayer.position)")
        self.testLayer.position = CGPoint(x: 50, y: 500)
        print("Implicit animation layer 'to' position: \(self.testLayer.position)")
        
        CATransaction.commit()
        print("Explicit transaction commit")
        
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
    
    func basicImplicitAnimationWithLongerDurationMultiplePresentationLayerAndFlushTest()
    {
        CATransaction.begin()
        print("Explicit transaction begin")
        
        CATransaction.setAnimationDuration(5.0)
        print("Explicit transaction animation duration: \(CATransaction.animationDuration())")
        
        print("Implicit animation layer 'from' position: \(self.testLayer.position)")
        self.testLayer.position = CGPoint(x: 50, y: 500)
        print("Implicit animation layer 'to' position: \(self.testLayer.position)")
        
        CATransaction.commit()
        print("Explicit transaction commit")
        
        print("Sleep for one second")
        sleep(1)
        
        if let presentationLayer = self.testLayer.presentationLayer()
        {
            print("Presentation layer position: \(presentationLayer.position)")
        }
        
        print("Sleep for one second")
        sleep(1)
        
        print("Flush transaction")
        CATransaction.flush()
        
        if let presentationLayer = self.testLayer.presentationLayer()
        {
            print("Presentation layer position: \(presentationLayer.position)")
        }
    }
    
    func basicExplicitAnimationTest()
    {
        CATransaction.setDisableActions(true)
        print("Disable transaction actions")
        
        let fromPosition = self.testLayer.position
        print("Model layer position 'from' position: \(fromPosition)")

        let toPosition = CGPoint(x: 50, y: 500)
        print("Model layer 'to' position: \(toPosition)")
    
        self.testLayer.position = toPosition

        let animation = CABasicAnimation(keyPath: "position")
        print("Explicit CABasicAnimation on layer property \(animation.keyPath)")
        
        animation.duration = 5.0
        print("Explicit animation duration: \(animation.duration)")
        
        animation.fromValue = NSValue(CGPoint: fromPosition)
        print("Explicit animation layer 'from' position: \(animation.fromValue)")
        
        animation.toValue = NSValue(CGPoint: CGPoint(x: 50, y: 500))
        print("Explicit animation layer 'to' position: \(animation.toValue)")
        
        print("Add animation to test layer")
        self.testLayer.addAnimation(animation, forKey: nil)
    }
    
    func basicExplicitAnimationWithExplicitTransactionTest()
    {
        CATransaction.begin()
        print("Explicit transaction begin")
        
        CATransaction.setDisableActions(true)
        print("Disable transaction actions")
        
        let fromPosition = self.testLayer.position
        print("Model layer position 'from' position: \(fromPosition)")
        
        let toPosition = CGPoint(x: 50, y: 500)
        print("Model layer 'to' position: \(toPosition)")
        
        self.testLayer.position = toPosition
        
        let animation = CABasicAnimation(keyPath: "position")
        print("Explicit CABasicAnimation on layer property \(animation.keyPath)")
        
        animation.duration = 5.0
        print("Explicit animation duration: \(animation.duration)")
        
        animation.fromValue = NSValue(CGPoint: fromPosition)
        print("Explicit animation layer 'from' position: \(animation.fromValue)")
        
        animation.toValue = NSValue(CGPoint: CGPoint(x: 50, y: 500))
        print("Explicit animation layer 'to' position: \(animation.toValue)")
        
        print("Add animation to test layer")
        self.testLayer.addAnimation(animation, forKey: nil)
        
        CATransaction.commit()
        print("Explicit transaction commit")
    }
    
    func basicExplicitAnimationWithExplicitTransactionPresentationLayerTest()
    {
        CATransaction.begin()
        print("Explicit transaction begin")
        
        CATransaction.setDisableActions(true)
        print("Disable transaction actions")
        
        let fromPosition = self.testLayer.position
        print("Model layer position 'from' position: \(fromPosition)")
        
        let toPosition = CGPoint(x: 50, y: 500)
        print("Model layer 'to' position: \(toPosition)")
        
        self.testLayer.position = toPosition
        
        let animation = CABasicAnimation(keyPath: "position")
        print("Explicit CABasicAnimation on layer property \(animation.keyPath)")
        
        animation.duration = 5.0
        print("Explicit animation duration: \(animation.duration)")
        
        animation.fromValue = NSValue(CGPoint: fromPosition)
        print("Explicit animation layer 'from' position: \(animation.fromValue)")
        
        animation.toValue = NSValue(CGPoint: CGPoint(x: 50, y: 500))
        print("Explicit animation layer 'to' position: \(animation.toValue)")
        
        print("Add animation to test layer")
        self.testLayer.addAnimation(animation, forKey: nil)
        
        CATransaction.commit()
        print("Explicit transaction commit")
        
        print("Sleep for one second")
        sleep(1)
        
        if let presentationLayer = self.testLayer.presentationLayer()
        {
            print("Presentation layer position: \(presentationLayer.position)")
        }
    }

    func basicExplicitAnimationWithExplicitTransactionPresentationLayerLongerInitialSleepTest()
    {
        CATransaction.begin()
        print("Explicit transaction begin")
        
        CATransaction.setDisableActions(true)
        print("Disable transaction actions")
        
        let fromPosition = self.testLayer.position
        print("Model layer position 'from' position: \(fromPosition)")
        
        let toPosition = CGPoint(x: 50, y: 500)
        print("Model layer 'to' position: \(toPosition)")
        
        self.testLayer.position = toPosition
        
        let animation = CABasicAnimation(keyPath: "position")
        print("Explicit CABasicAnimation on layer property \(animation.keyPath)")
        
        animation.duration = 5.0
        print("Explicit animation duration: \(animation.duration)")
        
        animation.fromValue = NSValue(CGPoint: fromPosition)
        print("Explicit animation layer 'from' position: \(animation.fromValue)")
        
        animation.toValue = NSValue(CGPoint: CGPoint(x: 50, y: 500))
        print("Explicit animation layer 'to' position: \(animation.toValue)")
        
        print("Add animation to test layer")
        self.testLayer.addAnimation(animation, forKey: nil)
        
        CATransaction.commit()
        print("Explicit transaction commit")
        
        print("Sleep for two seconds")
        sleep(2)
        
        if let presentationLayer = self.testLayer.presentationLayer()
        {
            print("Presentation layer position: \(presentationLayer.position)")
        }
    }
    
    func basicExplicitAnimationWithExplicitTransactionMultiplePresentationLayerTest()
    {
        CATransaction.begin()
        print("Explicit transaction begin")
        
        CATransaction.setDisableActions(true)
        print("Disable transaction actions")
        
        let fromPosition = self.testLayer.position
        print("Model layer position 'from' position: \(fromPosition)")
        
        let toPosition = CGPoint(x: 50, y: 500)
        print("Model layer 'to' position: \(toPosition)")
        
        self.testLayer.position = toPosition
        
        let animation = CABasicAnimation(keyPath: "position")
        print("Explicit CABasicAnimation on layer property \(animation.keyPath)")
        
        animation.duration = 5.0
        print("Explicit animation duration: \(animation.duration)")
        
        animation.fromValue = NSValue(CGPoint: fromPosition)
        print("Explicit animation layer 'from' position: \(animation.fromValue)")
        
        animation.toValue = NSValue(CGPoint: CGPoint(x: 50, y: 500))
        print("Explicit animation layer 'to' position: \(animation.toValue)")
        
        print("Add animation to test layer")
        self.testLayer.addAnimation(animation, forKey: nil)
        
        CATransaction.commit()
        print("Explicit transaction commit")
        
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
    
    func basicExplicitAnimationWithExplicitTransactionMultiplePresentationLayerAndFlushTest()
    {
        CATransaction.begin()
        print("Explicit transaction begin")
        
        CATransaction.setDisableActions(true)
        print("Disable transaction actions")
        
        let fromPosition = self.testLayer.position
        print("Model layer position 'from' position: \(fromPosition)")
        
        let toPosition = CGPoint(x: 50, y: 500)
        print("Model layer 'to' position: \(toPosition)")
        
        self.testLayer.position = toPosition
        
        let animation = CABasicAnimation(keyPath: "position")
        print("Explicit CABasicAnimation on layer property \(animation.keyPath)")
        
        animation.duration = 5.0
        print("Explicit animation duration: \(animation.duration)")
        
        animation.fromValue = NSValue(CGPoint: fromPosition)
        print("Explicit animation layer 'from' position: \(animation.fromValue)")
        
        animation.toValue = NSValue(CGPoint: CGPoint(x: 50, y: 500))
        print("Explicit animation layer 'to' position: \(animation.toValue)")
        
        print("Add animation to test layer")
        self.testLayer.addAnimation(animation, forKey: nil)
        
        CATransaction.commit()
        print("Explicit transaction commit")
        
        print("Sleep for one second")
        sleep(1)
        
        if let presentationLayer = self.testLayer.presentationLayer()
        {
            print("Presentation layer position: \(presentationLayer.position)")
        }
        
        print("Sleep for one second")
        sleep(1)
        
        print("Flush transaction")
        CATransaction.flush()
        
        if let presentationLayer = self.testLayer.presentationLayer()
        {
            print("Presentation layer position: \(presentationLayer.position)")
        }
    }

    func basicExplicitAnimationImplicitValuesWithExplicitTransactionMultiplePresentationLayerAndFlushBrokenTest()
    {
        CATransaction.begin()
        print("Explicit transaction begin")
        
        CATransaction.setDisableActions(true)
        print("Disable transaction actions")
        
        let fromPosition = self.testLayer.position
        print("Model layer position 'from' position: \(fromPosition)")
        
        let toPosition = CGPoint(x: 50, y: 500)
        print("Model layer 'to' position: \(toPosition)")
        
        self.testLayer.position = toPosition
        
        let animation = CABasicAnimation(keyPath: "position")
        print("Explicit CABasicAnimation on layer property \(animation.keyPath)")
        
        animation.duration = 5.0
        print("Explicit animation duration: \(animation.duration)")
        
        print("Add animation to test layer")
        self.testLayer.addAnimation(animation, forKey: nil)
        
        CATransaction.commit()
        print("Explicit transaction commit")
        
        print("Sleep for one second")
        sleep(1)
        
        if let presentationLayer = self.testLayer.presentationLayer()
        {
            print("Presentation layer position: \(presentationLayer.position)")
        }
        
        print("Sleep for one second")
        sleep(1)
        
        print("Flush transaction")
        CATransaction.flush()
        
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

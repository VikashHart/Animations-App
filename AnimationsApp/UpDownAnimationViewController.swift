//
//  ViewController.swift
//  AnimationsApp
//
//  Created by C4Q on 1/8/18.
//  Copyright © 2018 Vikash Hart. All rights reserved.
//

import UIKit

class UpDownAnimationViewController: UIViewController {
    
    var originalPosition: CGRect = .zero

    @IBOutlet weak var squareView: UIView!
    
    @IBOutlet weak var animateButton: UIButton!
    
    @IBAction func animateButtonPressed(_ sender: UIButton) {
        animateButton.isEnabled = false
        UIView.animate(withDuration: 3.0) {
            self.squareView.backgroundColor = .red 
        }
        UIView.animate(withDuration: 1.0) {
            self.squareView.backgroundColor = .blue
        }
        
        var finalPosition = CGRect()
        if squareView.frame == originalPosition {
            finalPosition = originalPosition.offsetBy(dx: 0, dy: -(self.view.frame.height * 2.0))
        } else {
            finalPosition = originalPosition
        }
        
        UIView.animate(withDuration: 3.0, animations: {
            self.squareView.frame = finalPosition}, completion: { (success) in
                self.animateButton.isEnabled = true
                finalPosition = self.originalPosition
                print("completion success")
        })
        
//        var finalPosition = CGRect()
//        if squareView.frame == originalPosition {
//            finalPosition = originalPosition.offsetBy(dx: 0, dy: -(self.view.frame.height * 0.8))
//        } else {
//            finalPosition = originalPosition
//        }
//        UIView.animate(withDuration: 3.0, animations: {
//            self.squareView.frame = finalPosition}, completion:{ (success) in
//            self.animateButton.isEnabled = true
//
//            print("completion success")
//        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalPosition = squareView.frame
    }

}


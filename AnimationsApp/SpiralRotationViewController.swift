//
//  SpiralViewController.swift
//  AnimationsApp
//
//  Created by C4Q on 1/8/18.
//  Copyright © 2018 Vikash Hart. All rights reserved.
//

import UIKit

class SpiralRotationViewController: UIViewController {
    
    var originalPosition = CGFloat()
    
    var isItSpinning = false
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinButton: UIButton!
    @IBAction func spinButtonPressed(_ sender: UIButton) {
        //spinButtonLabel.isEnabled = false
        isItSpinning = !isItSpinning
        animateButton()
    }
    
    func animateButton() {
        if !isItSpinning {
            return
        }
        UIView.animate(withDuration: 0.9, delay: 0, options: [.curveLinear] ,animations: {
            //setting the 5 to negative will make the imageView rotate clockwise & positive will make the imageView rotate counter clockwise.
            let newPosition = self.originalPosition + -5
            self.imageView.transform = CGAffineTransform(rotationAngle: newPosition)
            self.originalPosition = newPosition
        }, completion: { (success) in
            self.spinButton.isEnabled = true
            // This line below will set the app to call the button function  after the animation has completed, essentially chaining the completion handlers. ***This method will not use the button and thus will not block up the button functionality.
            self.animateButton()
            // This line below will set the button to click itself after the animation has completed, essentially chaining the completion handlers. ***However this will block up the button action so clicking it will continue to run the animation instead of changing the bool to stop or start the animation!!!!!!
            //self.spinButtonLabel.sendActions(for: .touchUpInside )
            print("it worked")
        })
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //spinButtonLabel.titleLabel?.text = "Spin it!"
        spinButton.setTitle("Spin it!", for: .normal)
        imageView.image = #imageLiteral(resourceName: "pink-floyd") //images are "spiral", "sasuke-sharingan", & "madara-sharingan"
        //lines below will round the image to be a perfect circle.
        imageView.layer.cornerRadius = self.imageView.bounds.width / 2.0
        imageView.layer.masksToBounds = true
    }

}

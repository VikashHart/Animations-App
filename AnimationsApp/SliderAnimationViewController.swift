//
//  SliderAnimationViewController.swift
//  AnimationsApp
//
//  Created by C4Q on 1/8/18.
//  Copyright © 2018 Vikash Hart. All rights reserved.
//

import UIKit

class SliderAnimationViewController: UIViewController {

    var animator: UIViewPropertyAnimator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        slider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        slider.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
        
        
        let box = UIView(frame: CGRect(x: -30, y: 0, width: 100, height: 100))
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .purple
        box.center.y = view.center.y * 0.7
        view.addSubview(box)
        animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut, animations: {
            box.center.x = self.view.frame.width
            box.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
            
            box.layer.cornerRadius = box.bounds.width / 2.0
            box.layer.masksToBounds = true
        })
    }
    
    @objc func sliderChanged(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }
    
}

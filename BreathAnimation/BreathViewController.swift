//
//  BreathViewController.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit

class BreathViewController: UIViewController {
    
    weak var output: BreathViewOutput!
    
    @IBOutlet weak var animationTypeLabel: UILabel!
    @IBOutlet weak var animationRemainingTimeLabel: UILabel!
    @IBOutlet weak var animationIndicatorView: UIView!
    @IBOutlet weak var totalRemainingTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
}

extension BreathViewController: BreathViewInput {
    
    func setAnimationType(_ animationType: String?) {
        animationTypeLabel.text = animationType
    }
    
    func setAnimationRemainingTime(_ animationRemainingTime: String?) {
        animationRemainingTimeLabel.text = animationRemainingTime
    }
    
    func setIndicatorScale(_ scale: CGFloat) {
        animationIndicatorView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    func setIndicatorColor(_ color: UIColor) {
        animationIndicatorView.backgroundColor = color
    }
    
    func setTotalRemainingTime(_ remainingTime: String?) {
        totalRemainingTimeLabel.text = remainingTime
    }
    
}

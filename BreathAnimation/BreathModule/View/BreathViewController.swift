//
//  BreathViewController.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit

class BreathViewController: UIViewController {
    
    var output: BreathViewOutput!
    
    @IBOutlet weak var animationTypeLabel: UILabel!
    @IBOutlet weak var animationRemainingTimeLabel: UILabel!
    @IBOutlet weak var animationIndicatorView: UIView!
    @IBOutlet weak var totalRemainingTimeLabel: UILabel!
    
    private lazy var tapRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(BreathViewController.tapView)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(tapRecognizer)
        output?.viewIsReady()
    }
    
    @objc private func tapView(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .recognized {
            output.didTapOnView()
        }
    }
    
}

extension BreathViewController: BreathViewInput {
    
    func setAnimationType(_ animationType: String?) {
        animationTypeLabel.text = animationType
    }
    
    func setAnimationRemainingTime(_ animationRemainingTime: String?) {
        animationRemainingTimeLabel.text = animationRemainingTime
    }
    
    func setIndicatorScale(_ scale: CGFloat, with duration: TimeInterval) {
        UIView.animate(withDuration: duration) { [animationIndicatorView] in
            animationIndicatorView?.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    
    func setIndicatorColor(_ color: UIColor) {
        animationIndicatorView.backgroundColor = color
    }
    
    func setTotalRemainingTime(_ remainingTime: String?) {
        totalRemainingTimeLabel.text = remainingTime
    }
    
    func setUserInteractionEnabled(_ enabled: Bool) {
        tapRecognizer.isEnabled = enabled
    }
    
}

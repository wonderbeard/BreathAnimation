//
//  BreathViewInterface.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit

protocol BreathViewInput: class {
    
    var output: BreathViewOutput! { get set }
    
    func setAnimationType(_ animationType: String?)
    
    func setAnimationRemainingTime(_ animationRemainingTime: String?)
    
    func setIndicatorScale(_ scale: CGFloat, with duration: TimeInterval)
    
    func setIndicatorColor(_ color: UIColor)
    
    func setTotalRemainingTime(_ remainingTime: String?)
    
    func setUserInteractionEnabled(_ enabled: Bool)
    
}

extension BreathViewInput {
    
    func setIndicatorScale(_ scale: CGFloat) {
        let zeroDuration = 0 as TimeInterval
        setIndicatorScale(scale, with: zeroDuration)
    }
    
}

protocol BreathViewOutput {
    
    func viewIsReady()
    
    func didTapOnView()
    
}

//
//  BreathViewInterface.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit

protocol BreathViewInput: class {
    func setAnimationType(_ animationType: String?)
    func setAnimationRemainingTime(_ animationRemainingTime: String?)
    func setIndicatorScale(_ scale: CGFloat)
    func setIndicatorColor(_ color: UIColor)
    func setTotalRemainingTime(_ remainingTime: String?)
}

protocol BreathViewOutput {
    func viewIsReady()
}

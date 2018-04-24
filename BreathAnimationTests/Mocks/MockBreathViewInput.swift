//
//  MockBreathView.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit
@testable import BreathAnimation

class MockBreathViewInput: BreathViewInput {
    
    private(set) var totalRemainingTimeValues: [String?] = []
    private(set) var animationTypeValues: [String?] = []
    private(set) var animationRemainingTimeValues: [String?] = []
    private(set) var inidicatorScaleStateValues: [(scale: CGFloat, duration: TimeInterval)] = []
    private(set) var inidcatorColorValues: [UIColor] = []
    private(set) var userInteractionEnabledValues: [Bool] = []
    
    var onSetTotalRemainingTime: (String?) -> Void = { _ in }
    var onSetAnimationRemainingTime: (String?) -> Void = { _ in }
    
    // MARK: - BreathViewInput
    
    var output: BreathViewOutput!
    
    func setAnimationType(_ animationType: String?) {
        animationTypeValues.append(animationType)
    }
    
    func setAnimationRemainingTime(_ animationRemainingTime: String?) {
        onSetAnimationRemainingTime(animationRemainingTime)
        animationRemainingTimeValues.append(animationRemainingTime)
    }
    
    func setIndicatorScale(_ scale: CGFloat, with duration: TimeInterval) {
        inidicatorScaleStateValues.append((scale, duration))
    }
    
    func setIndicatorColor(_ color: UIColor) {
        inidcatorColorValues.append(color)
    }
    
    func setTotalRemainingTime(_ remainingTime: String?) {
        onSetTotalRemainingTime(remainingTime)
        totalRemainingTimeValues.append(remainingTime)
    }
    
    func setUserInteractionEnabled(_ enabled: Bool) {
        userInteractionEnabledValues.append(enabled)
    }
    
}

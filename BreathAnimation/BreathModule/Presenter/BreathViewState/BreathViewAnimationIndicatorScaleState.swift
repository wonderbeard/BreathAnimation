//
//  BreathViewStateAnimationIndicatorScale.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation
import CoreGraphics

struct BreathViewAnimationIndicatorScaleState: BreathViewState {
    
    var scale: CGFloat
    var duration: TimeInterval
    
    func apply(on view: BreathViewInput) {
        view.setIndicatorScale(scale, with: duration)
    }
    
}

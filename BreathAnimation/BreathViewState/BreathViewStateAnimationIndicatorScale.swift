//
//  BreathViewStateAnimationIndicatorScale.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import CoreGraphics

struct BreathViewStateAnimationIndicatorScale: BreathViewState {
    
    var scale: CGFloat
    
    func apply(on view: BreathViewInput) {
        view.setIndicatorScale(scale)
    }
    
}

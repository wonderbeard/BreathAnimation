//
//  File.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit

struct BreathViewStateAnimationIndicatorColor: BreathViewState {
    
    var color: UIColor
    
    func apply(on view: BreathViewInput) {
        view.setIndicatorColor(color)
    }
    
}

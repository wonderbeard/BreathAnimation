//
//  BreathViewStateAnimationRemainingTime.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

struct BreathViewStateAnimationRemainingTime: BreathViewState {
    
    var formatter: DateFormatter
    let countdown: Countdown
    
    func apply(on view: BreathViewInput) {
        countdown.start { [formatter] remainingTime in
            let remainingText = formatter.string(from: Date(timeIntervalSince1970: remainingTime))
            view.setAnimationRemainingTime(remainingText)
        }
    }
    
}

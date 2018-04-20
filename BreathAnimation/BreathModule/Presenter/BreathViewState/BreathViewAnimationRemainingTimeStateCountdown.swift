//
//  BreathViewStateAnimationRemainingTime.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

struct BreathViewAnimationRemainingTimeStateCountdown: BreathViewState {

    let countdown: Countdown
    let timeFormatter: AnyMapper<TimeInterval, String?>
    
    func apply(on view: BreathViewInput) {
        countdown.start { [timeFormatter] remainingTime in
            let remainingTimeText = timeFormatter.map(remainingTime)
            view.setAnimationRemainingTime(remainingTimeText)
        }
    }
    
}

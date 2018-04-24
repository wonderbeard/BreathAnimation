//
//  Countdown.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

class Countdown {
    
    let duration: TimeInterval
    let interval: TimeInterval
    
    init(duration: TimeInterval, interval: TimeInterval = 1) {
        self.duration = duration
        self.interval = interval
    }
    
    @discardableResult
    func start(_ handler: @escaping (_ remainingTime: TimeInterval) -> Void) -> Cancellable {
        var remainingTime = duration
        handler(remainingTime)
        let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            remainingTime -= timer.timeInterval
            if remainingTime >= 0 {
                handler(remainingTime)
            }
            if remainingTime <= 0 {
                timer.invalidate()
            }
        }
        return ClosureCancellable {
            timer.invalidate()
        }
    }
    
}

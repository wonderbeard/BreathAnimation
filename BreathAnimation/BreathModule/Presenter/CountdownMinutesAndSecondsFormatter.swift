//
//  BreathAnimationRemainingTimeMapper.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 20.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

struct CountdownMinutesAndSecondsFormatter: Mapper {
    
    func map(_ time: TimeInterval) -> String? {
        let time = Int(time)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
}

//
//  BreathViewAnimationRemainingTimeStateText.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 20.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

struct BreathViewAnimationRemainingTimeStateText: BreathViewState {
    
    var remainingTime: String?
    
    init(_ remainingTime: String?) {
        self.remainingTime = remainingTime
    }
    
    func apply(on view: BreathViewInput) {
        view.setAnimationRemainingTime(remainingTime)
    }
    
}

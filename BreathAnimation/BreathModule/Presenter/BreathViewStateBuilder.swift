//
//  DefaultBreathViewStateBuilder.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 22.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit

class BreathViewStateBuilder {
    
    private var reducers: [(BreathViewInput) -> Void] = []
    
    func setTitle(_ title: String?) {
        reducers.append { view in
            view.setAnimationType(title)
        }
    }
    
    func setAnimationIndicatorColor(_ color: UIColor) {
        reducers.append { view in
            view.setIndicatorColor(color)
        }
    }
    
    func setRemainingTimeText(_ remainingTime: String?) {
        reducers.append { view in
            view.setAnimationRemainingTime(remainingTime)
        }
    }
    
    func setRemainingTimeCountdown(_ countdown: Countdown, formatter: AnyMapper<TimeInterval, String?>) {
        reducers.append { view in
            countdown.start { remainingTime in
                let remainingTimeText = formatter.map(remainingTime)
                view.setAnimationRemainingTime(remainingTimeText)
            }
        }
    }
    
    func setTotalRemainingTimeText(_ totalRemainingText: String?) {
        reducers.append { view in
            view.setTotalRemainingTime(totalRemainingText)
        }
    }
    
    func setAnimationIndicatorScale(_ scale: CGFloat, transitionDuration: TimeInterval) {
        reducers.append { view in
            view.setIndicatorScale(scale, with: transitionDuration)
        }
    }
    
    func setUserInteractionEnabled(_ enabled: Bool) {
        reducers.append { view in
            view.setUserInteractionEnabled(enabled)
        }
    }
    
    func getResult() -> BreathViewState {
        return CompositeBreathViewState(
            composables: reducers.map(ClosureBreathViewState.init)
        )
    }
    
}

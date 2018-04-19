//
//  BreathViewStateFactory.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

protocol BreathViewStateFactory {
    func makeState(for command: AnimationScript.Command) -> BreathViewState
}

class DefaultBreathViewStateFactory: BreathViewStateFactory {
    
    lazy var remainingTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss"
        return formatter
    }()
    
    func makeState(for command: AnimationScript.Command) -> BreathViewState {
        switch command.type {
        case .inhale:
            return makeInhaleState(for: command)
        case .exhale:
            return makeExhaleState(for: command)
        case .hold:
            return makeHoldState(for: command)
        }
    }
    
    private func makeInhaleState(for command: AnimationScript.Command) -> BreathViewState {
        return CompositeBreathViewState(
            makeSharedState(for: command),
            BreathViewStateAnimationIndicatorScale(scale: 1)
        )
    }
    
    private func makeExhaleState(for command: AnimationScript.Command) -> BreathViewState {
        return CompositeBreathViewState(
            makeSharedState(for: command),
            BreathViewStateAnimationIndicatorScale(scale: 0.5)
        )
    }
    
    private func makeHoldState(for command: AnimationScript.Command) -> BreathViewState {
        return makeSharedState(for: command)
    }
    
    private func makeSharedState(for command: AnimationScript.Command) -> BreathViewState {
        return CompositeBreathViewState(
            BreathViewStateAnimationType(name: command.type.rawValue),
            BreathViewStateAnimationIndicatorColor(color: command.color),
            BreathViewStateAnimationRemainingTime(
                formatter: remainingTimeFormatter,
                countdown: Countdown(duration: command.duration, interval: 1)
            )
        )
    }
    
}

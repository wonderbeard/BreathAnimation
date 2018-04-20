//
//  BreathViewStateFactory.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation
import SwiftHEXColors

protocol BreathViewStateFactory {
    func makeState(for command: AnimationScript.Command) -> BreathViewState
    func makeIdleState(transitionDuration: TimeInterval) -> BreathViewState
}

class DefaultBreathViewStateFactory: BreathViewStateFactory {
    
    lazy var remainingTimeFormatter: AnyMapper<TimeInterval, String?>
        = AnyMapper(CountdownMinutesAndSecondsFormatter())
    
    lazy var commandNameFormatter: AnyMapper<AnimationScript.Command, String?>
        = AnyMapper(UppercasedAnimationScriptCommandTypeFormatter())
    
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
    
    func makeIdleState(transitionDuration: TimeInterval) -> BreathViewState {
        return CompositeBreathViewState(
            BreathViewAnimationTypeState(name: "TAP TO START"),
            BreathViewAnimationIndicatorColorState(color: UIColor(hex: 0x7A83F2)!),
            BreathViewAnimationIndicatorScaleState(scale: 0.75, duration: transitionDuration),
            BreathViewAnimationRemainingTimeStateText(nil),
            BreathViewUserInteractionEnabledState(true)
        )
    }
    
    private func makeInhaleState(for command: AnimationScript.Command) -> BreathViewState {
        let animationName = commandNameFormatter.map(command)
        return CompositeBreathViewState(
            BreathViewAnimationTypeState(name: animationName),
            BreathViewAnimationIndicatorColorState(color: command.color),
            BreathViewAnimationRemainingTimeStateCountdown(
                countdown: Countdown(duration: command.duration, interval: 1),
                timeFormatter: remainingTimeFormatter
            ),
            BreathViewAnimationIndicatorScaleState(scale: 1, duration: command.duration),
            BreathViewUserInteractionEnabledState(false)
        )
    }
    
    private func makeExhaleState(for command: AnimationScript.Command) -> BreathViewState {
        let animationName = commandNameFormatter.map(command)
        return CompositeBreathViewState(
            BreathViewAnimationTypeState(name: animationName),
            BreathViewAnimationIndicatorColorState(color: command.color),
            BreathViewAnimationRemainingTimeStateCountdown(
                countdown: Countdown(duration: command.duration, interval: 1),
                timeFormatter: remainingTimeFormatter
            ),
            BreathViewAnimationIndicatorScaleState(scale: 0.5, duration: command.duration),
            BreathViewUserInteractionEnabledState(false)
        )
    }
    
    private func makeHoldState(for command: AnimationScript.Command) -> BreathViewState {
        let animationName = commandNameFormatter.map(command)
        return CompositeBreathViewState(
            BreathViewAnimationTypeState(name: animationName),
            BreathViewAnimationIndicatorColorState(color: command.color),
            BreathViewAnimationRemainingTimeStateCountdown(
                countdown: Countdown(duration: command.duration, interval: 1),
                timeFormatter: remainingTimeFormatter
            ),
            BreathViewUserInteractionEnabledState(false)
        )
    }
    
}

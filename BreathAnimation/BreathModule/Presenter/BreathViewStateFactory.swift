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
    
    enum Constants {
        static let inhaleAnimationIndicatorScale: CGFloat = 1
        static let exhaleAnimationIndicatorScale: CGFloat = 0.5
        static let idleState = (
            animationIndicatorScale: 0.75 as CGFloat,
            animationIndicatorColor: UIColor(hex: 0x7A83F2)!,
            title: "TAP TO START"
        )
    }
    
    lazy var remainingTimeFormatter = AnyMapper(CountdownMinutesAndSecondsFormatter())
    lazy var commandNameFormatter = AnyMapper(UppercasedAnimationScriptCommandTypeFormatter())
    
    func makeState(for command: AnimationScript.Command) -> BreathViewState {
        switch command.type {
        case .inhale:
            return makeTransitionState(for: command, scale: Constants.inhaleAnimationIndicatorScale)
        case .exhale:
            return makeTransitionState(for: command, scale: Constants.exhaleAnimationIndicatorScale)
        case .hold:
            return makeHoldState(for: command)
        }
    }
    
    func makeIdleState(transitionDuration: TimeInterval) -> BreathViewState {
        let builder = BreathViewStateBuilder()
        builder.setTitle(Constants.idleState.title)
        builder.setAnimationIndicatorColor(Constants.idleState.animationIndicatorColor)
        builder.setAnimationIndicatorScale(Constants.idleState.animationIndicatorScale, transitionDuration: transitionDuration)
        builder.setRemainingTimeText(nil)
        builder.setTotalRemainingTimeText(nil)
        builder.setUserInteractionEnabled(true)
        return builder.getResult()
    }
    
    private func makeTransitionState(for command: AnimationScript.Command, scale: CGFloat) -> BreathViewState {
        let builder = BreathViewStateBuilder()
        builder.setTitle(commandNameFormatter.map(command))
        builder.setAnimationIndicatorColor(command.color)
        builder.setAnimationIndicatorScale(scale, transitionDuration: command.duration)
        builder.setRemainingTimeCountdown(Countdown(duration: command.duration), formatter: remainingTimeFormatter)
        builder.setUserInteractionEnabled(false)
        return builder.getResult()
    }
    
    private func makeHoldState(for command: AnimationScript.Command) -> BreathViewState {
        let builder = BreathViewStateBuilder()
        builder.setTitle(commandNameFormatter.map(command))
        builder.setAnimationIndicatorColor(command.color)
        builder.setRemainingTimeCountdown(Countdown(duration: command.duration), formatter: remainingTimeFormatter)
        builder.setUserInteractionEnabled(false)
        return builder.getResult()
    }
    
}

//
//  MockBreathViewStateFactory.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.18.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation
@testable import BreathAnimation

class MockBreathViewStateFactory: BreathViewStateFactory {
    
    var onMakeStateForCommand: (AnimationScript.Command) -> BreathViewState = { _ in CompositeBreathViewState() }
    var onMakeIdleState: (TimeInterval) -> BreathViewState = { _ in CompositeBreathViewState() }
    
    func makeState(for command: AnimationScript.Command) -> BreathViewState {
        return onMakeStateForCommand(command)
    }
    
    func makeIdleState(transitionDuration: TimeInterval) -> BreathViewState {
        return onMakeIdleState(transitionDuration)
    }
    
}

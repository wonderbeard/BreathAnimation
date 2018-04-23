//
//  MockBreathInteractorOutput.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation
@testable import BreathAnimation

class MockBreathInteractorOutput: BreathInteractorOutput {
    
    var onDidStart: (AnimationScript) -> Void = { _ in }
    var onDidStartCommand: (AnimationScript.Command) -> Void = { _ in }
    var onDidFinish: () -> Void = {}
    
    func didStartScript(_ animationScript: AnimationScript) {
        onDidStart(animationScript)
    }
    
    func didStartCommand(_ command: AnimationScript.Command) {
        onDidStartCommand(command)
    }
    
    func didFinish() {
        onDidFinish()
    }
    
}

//
//  MockBreathInteractorInput.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation
@testable import BreathAnimation

class MockBreathInteractorInput: BreathInteractorInput {
    
    var output: BreathInteractorOutput!
    
    private(set) var runnedScripts: [AnimationScript] = []
    
    func runScript(_ animationScript: AnimationScript) {
        runnedScripts.append(animationScript)
    }
    
}

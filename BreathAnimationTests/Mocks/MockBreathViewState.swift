//
//  MockBreathViewState.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.18.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation
@testable import BreathAnimation

class MockBreathViewState: BreathViewState {
    
    private(set) var viewsAppliedOn: [BreathViewInput] = []
    
    var isApplyCalled: Bool {
        return viewsAppliedOn.count > 0
    }
    
    func apply(on view: BreathViewInput) {
        viewsAppliedOn.append(view)
    }
    
}

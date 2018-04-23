//
//  ClosureBreathViewState.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 22.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

struct ClosureBreathViewState: BreathViewState {
    
    private let performApply: (BreathViewInput) -> Void
    
    init(_ action: @escaping (BreathViewInput) -> Void) {
        performApply = action
    }
    
    func apply(on view: BreathViewInput) {
        performApply(view)
    }
    
}

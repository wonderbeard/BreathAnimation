//
//  CompositeBreathViewState.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

struct CompositeBreathViewState: BreathViewState {
    
    private var composables: [BreathViewState]
    
    init(_ composables: BreathViewState...) {
        self.composables = composables
    }
    
    init(composables: [BreathViewState]) {
        self.composables = composables
    }
    
    mutating func append(_ state: BreathViewState) {
        composables.append(state)
    }
    
    func apply(on view: BreathViewInput) {
        composables.forEach{ $0.apply(on: view) }
    }
    
}

//
//  BreathViewStateUserInteractionEnabled.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 20.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

struct BreathViewUserInteractionEnabledState: BreathViewState {
    
    var enabled: Bool
    
    init(_ enabled: Bool) {
        self.enabled = enabled
    }
    
    func apply(on view: BreathViewInput) {
        view.setUserInteractionEnabled(enabled)
    }
    
}

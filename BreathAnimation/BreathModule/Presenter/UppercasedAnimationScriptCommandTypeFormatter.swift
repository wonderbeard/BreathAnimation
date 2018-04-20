//
//  CapitalizedAnimationScriptCommandTypeFormatter.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 20.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

struct UppercasedAnimationScriptCommandTypeFormatter: Mapper {
    
    func map(_ command: AnimationScript.Command) -> String? {
        return command.type.rawValue.uppercased()
    }
    
}

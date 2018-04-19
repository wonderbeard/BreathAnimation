//
//  ScriptCommand.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit

struct ScriptCommand {
    
    enum CommandType: String, Codable {
        case inhale, exhale, hold
    }
    
    var type: CommandType
    var duration: TimeInterval
    var color: UIColor
    
}

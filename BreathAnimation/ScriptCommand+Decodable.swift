//
//  ScriptCommand+Decodable.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit
import SwiftHEXColors

enum ScriptCommandDecodingError: Error {
    case colorInappropriateFormat
}

extension ScriptCommand: Decodable {
    
    enum DecodingKey: String, CodingKey {
        case type, duration, color
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DecodingKey.self)
        self.type = try container.decode(CommandType.self, forKey: .type)
        self.duration = try container.decode(TimeInterval.self, forKey: .duration)
        let colorHex = try container.decode(String.self, forKey: .color)
        if let color = UIColor(hexString: colorHex) {
            self.color = color
        } else {
            throw ScriptCommandDecodingError.colorInappropriateFormat
        }
    }
    
}

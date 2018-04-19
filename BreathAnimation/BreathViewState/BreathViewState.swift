//
//  BreathViewState.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

protocol BreathViewState {
    func apply(on view: BreathViewInput)
}

//
//  BreathInteractor.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

protocol BreathInteractorInput {
    
    var output: BreathInteractorOutput! { get set }
    
    func runScript(_ animationScript: AnimationScript)
    
}

protocol BreathInteractorOutput: class {
    
    func didStartCommand(_ command: AnimationScript.Command)
    
    func didFinish()
    
}

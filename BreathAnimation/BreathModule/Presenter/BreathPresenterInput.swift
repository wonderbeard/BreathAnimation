//
//  BreathPresenterInput.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 20.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

protocol BreathPresenterInput {
    
    var view: BreathViewInput! { get set }
    
    var interactor: BreathInteractorInput! { get set }
    
    func setAnimationScript(_ script: AnimationScript)
    
    func animate()
    
}

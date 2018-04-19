//
//  BreathPresenter.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit

protocol BreathPresenterInput {
    
    var view: BreathViewInput! { get set }
    
    var interactor: BreathInteractorInput! { get set }
    
    func setAnimationScript(_ script: AnimationScript)
    
    func animate()
    
}

class BreathPresenter: BreathPresenterInput {
    
    weak var view: BreathViewInput!
    var interactor: BreathInteractorInput!
    var viewStateFactory: BreathViewStateFactory = DefaultBreathViewStateFactory()
    
    private var animationScript: AnimationScript = .empty
    
    func setAnimationScript(_ script: AnimationScript) {
        animationScript = script
    }
    
    func animate() {
        interactor.runScript(animationScript)
    }
    
}

extension BreathPresenter: BreathViewOutput {
    
    func viewIsReady() {
        view.setIndicatorScale(0.75)
        view.setUserInteractionEnabled(true)
    }
    
    func didTapOnView() {
        view.setUserInteractionEnabled(false)
        animate()
    }
    
}

extension BreathPresenter: BreathInteractorOutput {
    
    func didStartCommand(_ command: AnimationScript.Command) {
        viewStateFactory.makeState(for: command).apply(on: view)
    }
    
    func didFinish() {
        view.setIndicatorScale(0.75)
        view.setUserInteractionEnabled(true)
    }
    
}

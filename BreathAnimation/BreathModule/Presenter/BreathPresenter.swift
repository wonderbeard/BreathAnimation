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
    
    private func applyViewState(_ state: BreathViewState) {
        state.apply(on: view)
    }
    
}

extension BreathPresenter: BreathViewOutput {
    
    func viewIsReady() {
        let idleState = viewStateFactory.makeIdleState(duration: 0)
        applyViewState(idleState)
    }
    
    func didTapOnView() {
        animate()
    }
    
}

extension BreathPresenter: BreathInteractorOutput {
    
    func didStartCommand(_ command: AnimationScript.Command) {
        let commandState = viewStateFactory.makeState(for: command)
        applyViewState(commandState)
    }
    
    func didFinish() {
        let idleState = viewStateFactory.makeIdleState(duration: 0.8)
        applyViewState(idleState)
    }
    
}

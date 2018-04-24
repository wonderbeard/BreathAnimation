//
//  BreathPresenter.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit

class BreathPresenter: BreathPresenterInput {

    weak var view: BreathViewInput!
    var interactor: BreathInteractorInput!
    var viewStateFactory: BreathViewStateFactory = DefaultBreathViewStateFactory()
    var totalRemainingTimeFormatter: AnyMapper<TimeInterval, String?>
        = AnyMapper(CountdownMinutesAndSecondsFormatter())
    
    private(set) var animationScript: AnimationScript?
    
    func setAnimationScript(_ script: AnimationScript) {
        animationScript = script
    }
    
    func animate() {
        animationScript.map(interactor.runScript)
    }
    
    private func applyViewState(_ state: BreathViewState) {
        state.apply(on: view)
    }
    
}

extension BreathPresenter: BreathViewOutput {
    
    func viewIsReady() {
        let idleState = viewStateFactory.makeIdleState(transitionDuration: 0)
        applyViewState(idleState)
    }
    
    func didTapOnView() {
        animate()
    }
    
}

extension BreathPresenter: BreathInteractorOutput {
    
    func didStartScript(_ animationScript: AnimationScript) {
        let countdown = Countdown(duration: animationScript.duration)
        countdown.start { [view, totalRemainingTimeFormatter] remainingTime in
            let remainingTimeText = totalRemainingTimeFormatter.map(remainingTime)
            view?.setTotalRemainingTime(remainingTimeText)
        }
    }
    
    func didStartCommand(_ command: AnimationScript.Command) {
        let commandState = viewStateFactory.makeState(for: command)
        applyViewState(commandState)
    }
    
    func didFinish() {
        let idleState = viewStateFactory.makeIdleState(transitionDuration: 0.4)
        applyViewState(idleState)
    }
    
}

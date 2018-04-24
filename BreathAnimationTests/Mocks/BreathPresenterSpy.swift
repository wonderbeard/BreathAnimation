//
//  MockBreathPresenter.swift
//  BreathAnimationTests
//
//  Created by Andrew Malyarchuk on 24.04.18.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation
@testable import BreathAnimation

class BreathPresenterSpy: BreathPresenterInput, BreathViewOutput {
    
    var setAnimationScriptWasCalled = false
    var animateWasCalled = false
    var viewIsReadyWasCalled = false
    var didTapOnViewWasCalled = false
    
    private(set) var victim: BreathPresenterInput & BreathViewOutput
    
    init(on victim: BreathPresenterInput & BreathViewOutput) {
        self.victim = victim
    }
    
    var view: BreathViewInput! {
        get { return victim.view }
        set { victim.view = newValue }
    }
    
    var interactor: BreathInteractorInput! {
        get { return victim.interactor }
        set { victim.interactor = newValue }
    }
    
    func setAnimationScript(_ script: AnimationScript) {
        setAnimationScriptWasCalled = true
        victim.setAnimationScript(script)
    }
    
    func animate() {
        animateWasCalled = true
        victim.animate()
    }
    
    func viewIsReady() {
        viewIsReadyWasCalled = true
        victim.viewIsReady()
    }
    
    func didTapOnView() {
        didTapOnViewWasCalled = true
        victim.didTapOnView()
    }
    
}

//
//  BreathModuleAssembly.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

class BreathModuleAssembler {
    
    private(set) var view: BreathViewInput
    private(set) var presenter: BreathPresenterInput & BreathViewOutput & BreathInteractorOutput
    private(set) var interactor: BreathInteractorInput
    
    init(
        view: BreathViewInput,
        presenter: BreathPresenterInput & BreathViewOutput & BreathInteractorOutput,
        interactor: BreathInteractorInput)
    {
        self.view = view
        self.presenter = presenter
        self.interactor = interactor
    }
    
    func assembly() {
        presenter.view = view
        view.output = presenter
        presenter.interactor = interactor
        interactor.output = presenter
    }
    
}

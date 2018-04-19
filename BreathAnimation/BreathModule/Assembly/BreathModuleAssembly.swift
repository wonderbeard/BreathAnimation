//
//  BreathModuleAssembly.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

class BreathModuleAssembly {
    
    var view: BreathViewInput!
    var presenter: (BreathPresenterInput & BreathViewOutput & BreathInteractorOutput)!
    var interactor: BreathInteractorInput!
    
    func assembly() {
        presenter.view = view
        view.output = presenter
        presenter.interactor = interactor
        interactor.output = presenter
    }
    
}

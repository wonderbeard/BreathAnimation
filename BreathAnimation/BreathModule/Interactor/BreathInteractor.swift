//
//  BreathInteractor.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import Foundation

class BreathInteractor: BreathInteractorInput {
    
    weak var output: BreathInteractorOutput!
    
    func runScript(_ animationScript: AnimationScript) {
        output.didStartScript(animationScript)
        resolve(animationScript)
    }
    
    private func resolve(_ script: AnimationScript) {
        guard script.commands.count > 0 else {
            output.didFinish()
            return
        }
        var script = script
        let command = script.commands.removeFirst()
        output.didStartCommand(command)
        Timer.scheduledTimer(withTimeInterval: command.duration, repeats: false) { [unowned self] _ in
            self.resolve(script)
        }
    }
    
}

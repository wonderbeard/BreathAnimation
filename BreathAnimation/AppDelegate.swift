//
//  AppDelegate.swift
//  BreathAnimation
//
//  Created by Andrew Malyarchuk on 19.04.2018.
//  Copyright © 2018 wonderbeard. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {

    let window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
}

extension AppDelegate: UIApplicationDelegate {
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        let jsonDecoder = JSONDecoder()
        let scriptFileURL = Bundle.main.url(forResource: "AnimationScript", withExtension: "json")
        let scriptData = scriptFileURL.flatMap{ try? Data.init(contentsOf: $0) }
        let scriptCommands = scriptData.flatMap{ try? jsonDecoder.decode([AnimationScript.Command].self, from: $0) }
        let script = scriptCommands.map(AnimationScript.init)
        
        let breathStoryboard = UIStoryboard(name: "BreathViewController", bundle: .main)
        let breathViewController = breathStoryboard.instantiateInitialViewController() as! BreathViewController
        let presenter = BreathPresenter()
        let interactor = BreathInteractor()
        
        BreathModuleAssembler(
            view: breathViewController,
            presenter: presenter,
            interactor: interactor
        ).assembly()
        
        presenter.setAnimationScript(script!)
        
        window?.rootViewController = breathViewController
        window?.makeKeyAndVisible()
    }
    
}

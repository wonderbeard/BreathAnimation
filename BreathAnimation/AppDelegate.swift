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
    let animationScript: AnimationScript?
    
    override init() {
        let jsonDecoder = JSONDecoder()
        let scriptFileURL = Bundle.main.url(forResource: "AnimationScript", withExtension: "json")
        let scriptData = scriptFileURL.flatMap{ try? Data.init(contentsOf: $0) }
        let scriptCommands = scriptData.flatMap{ try? jsonDecoder.decode([AnimationScript.Command].self, from: $0) }
        animationScript = scriptCommands.map(AnimationScript.init)
        super.init()
    }
    
}

extension AppDelegate: UIApplicationDelegate {
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        let breathStoryboard = UIStoryboard(name: "BreathViewController", bundle: .main)
        let breathViewController = breathStoryboard.instantiateInitialViewController() as! BreathViewController
        let presenter = BreathPresenter()
        let interactor = BreathInteractor()
        
        BreathModuleAssembler(
            view: breathViewController,
            presenter: presenter,
            interactor: interactor
        ).assembly()
        
        animationScript.map(presenter.setAnimationScript)
        
        window?.rootViewController = breathViewController
        window?.makeKeyAndVisible()
    }
    
}

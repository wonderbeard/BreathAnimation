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

    var window: UIWindow?
    let jsonDecoder = JSONDecoder()
    
}

extension AppDelegate: UIApplicationDelegate {
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        let scriptFileURL = Bundle.main.url(forResource: "AnimationScript", withExtension: "json")
        let scriptData = scriptFileURL.flatMap{ try? Data.init(contentsOf: $0) }
        let script = scriptData.flatMap{ try? jsonDecoder.decode([ScriptCommand].self, from: $0) }
        print(script!)
    }
    
}


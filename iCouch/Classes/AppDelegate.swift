//
//  AppDelegate.swift
//  iCouch
//
//  Created by Bruno da Luz on 15/03/18.
//  Copyright © 2018 Bruno da Luz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        rootModule(window: window)
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func rootModule(window: UIWindow?) {
        let module = MoviesTrackerModule()
        window?.rootViewController = module.start()
    }

}


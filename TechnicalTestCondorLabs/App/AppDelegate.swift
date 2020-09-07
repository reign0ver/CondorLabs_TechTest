//
//  AppDelegate.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 5/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let dependencyInjector = DIManager()
    
    //MARK: Instancia compartida para poder usar el AppDelegate desde cualquier parte asegurandonos de que siempre sea en el Main Thread
    static var shared: AppDelegate? {
        if Thread.isMainThread {
            return UIApplication.shared.delegate as? AppDelegate
        }
        var appDelegate: AppDelegate?
        DispatchQueue.main.sync {
            appDelegate = UIApplication.shared.delegate as? AppDelegate
        }
        return appDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setRootViewController()
        
        return true
    }
    
    private func setRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = CustomTabBarController()
    }

}


//
//  AppDelegate.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let navigationController = UINavigationController()
    
    //Singleton that provides dependencies using Service Locator pattern
    var serviceLocator = ServiceLocatorDefault()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let initialViewController = ProductListRouter.createProductListViewController(serviceLocator: serviceLocator)
        
        navigationController.viewControllers = [initialViewController]
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}


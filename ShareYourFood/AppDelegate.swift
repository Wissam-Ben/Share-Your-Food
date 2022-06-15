//
//  AppDelegate.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 05/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let w = UIWindow(frame: UIScreen.main.bounds)
        w.rootViewController = UINavigationController(rootViewController: RegisterViewController())
        w.makeKeyAndVisible()
        self.window = w
        
        return true
    }

}


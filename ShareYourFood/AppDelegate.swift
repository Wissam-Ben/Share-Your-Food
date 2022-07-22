//
//  AppDelegate.swift
//  ShareYourFood
//
//  Created by Benadjaoud Wissam on 05/06/2022.
//

import UIKit
import AWSS3

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let w = UIWindow(frame: UIScreen.main.bounds)
        w.rootViewController = UINavigationController(rootViewController: LogInViewController())
        w.makeKeyAndVisible()
        self.window = w
        
        self.startInternetMonitoring()
        self.initializeS3()
        
        return true
    }
    
    func initializeS3() {
        let poolId = Bundle.main.object(forInfoDictionaryKey: "AWSPoolId") as? String
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType: .APSouth1, identityPoolId: poolId)
        let configuration = AWSServiceConfiguration(region: .APSouth1, credentialsProvider: credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
    }
    func startInternetMonitoring(){
        if #available(iOS 12.0, *) {
            if !InternetConnectionMonitor.shared.isMonitoring {
                InternetConnectionMonitor.shared.startMonitoring()
            } else {
                InternetConnectionMonitor.shared.stopMonitoring()
            }
        } else {
            // Fallback on earlier versions
        }
    }

}


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
        
        self.initializeS3()
        
        return true
    }
    
    func initializeS3() {
        //let credentialsProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "us-east-1:4d930ef9-d523-47a7-9c83-38df908ad21e")
        let credentialsProvider = AWSStaticCredentialsProvider(accessKey: "AKIA3E6WIUD7XFMDQRMO", secretKey: "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")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
    }


}


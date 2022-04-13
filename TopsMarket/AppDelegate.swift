//
//  AppDelegate.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 27/02/2022.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let loginVC = LogInViewController()
        let tabBar = TabBarViewController()
        
        let navigationC = UINavigationController(rootViewController: tabBar)
//        navigationC.setNavigationBarHidden(true, animated: true)
        
        let isLogin = UserDefaults.standard.bool(forKey: "login")
        
        if isLogin {
            window?.rootViewController = navigationC
        }else {
            window?.rootViewController = loginVC
        }
        
        window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
        return true
    }
}


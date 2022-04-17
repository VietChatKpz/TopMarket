//
//  AppDelegate.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 27/02/2022.
//

import UIKit
import Firebase
import FBSDKCoreKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        
        window = UIWindow(frame: UIScreen.main.bounds)

        let loginVC = LogInViewController()
        let tabBar = TabBarViewController()

        let navigationC = UINavigationController(rootViewController: tabBar)
        navigationC.setNavigationBarHidden(true, animated: true)

        let isLogin = UserDefaults.standard.bool(forKey: "login")

        if isLogin {
            window?.rootViewController = navigationC
        }else {
            window?.rootViewController = loginVC
        }

        window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
        
//        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
//        GIDSignIn.sharedInstance()?.delegate = self
        
        return true
    }
    
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        
 
        
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
            
        )
        return GIDSignIn.sharedInstance.handle(url)
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }

        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation]
        )
    }
}


//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    var window: UIWindow?
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        window = UIWindow(frame: UIScreen.main.bounds)
//
//        let loginVC = LogInViewController()
//        let tabBar = TabBarViewController()
//
//        let navigationC = UINavigationController(rootViewController: tabBar)
////        navigationC.setNavigationBarHidden(true, animated: true)
//
//        let isLogin = UserDefaults.standard.bool(forKey: "login")
//
//        if isLogin {
//            window?.rootViewController = navigationC
//        }else {
//            window?.rootViewController = loginVC
//        }
//
//        window?.makeKeyAndVisible()
//
//        FirebaseApp.configure()
//        return true
//    }
//}


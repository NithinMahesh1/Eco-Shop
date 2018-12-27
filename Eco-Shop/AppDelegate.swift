//
//  AppDelegate.swift
//  Eco-Shop
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
//  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//    // Override point for customization after application launch.
//    return true
//  }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("Application did finish launching")
        return true
    }
    
    
    
    
    //launch screen
            private func splashScreen() {
                        let launchScreenVC = UIStoryboard.init(name: "LaunchScreen", bundle: nil)
                        let rootVC = launchScreenVC.instantiateViewController(withIdentifier: "splashController")
                        self.window?.rootViewController = rootVC
                        self.window?.makeKeyAndVisible()
                        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(dismissSplashController), userInfo: nil, repeats: false)
                }
            
            @objc func dismissSplashController(){
                        let mainVC = UIStoryboard.init(name: "Main", bundle: nil)
                        let rootVC = mainVC.instantiateViewController(withIdentifier: "initController")
                        self.window?.rootViewController = rootVC
                        self.window?.makeKeyAndVisible()
                }
  
}


//
//  AppDelegate.swift
//  TrainingMVVM
//
//  Created by Manh Nguyen on 6/10/17.
//  Copyright © 2017 NUS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let foods: [FoodModelView] = {
        let apples = Food(name: "Apples", country: "Everywhere", price: 10.1, photoURL: "https://loseitapp.files.wordpress.com/2014/09/istock_000014459318_double.jpg")
        let noodles = Food(name: "Noodles", country: "Viet Nam", price: 20.0, photoURL: "https://www.budgetbytes.com/wp-content/uploads/2016/05/Lime-Shrimp-Dragon-Noodles-Vs.jpg")
        let spaghetti = Food(name: "Spaghetti", country: "Italia", price: 100.0, photoURL: "https://cdn.instructables.com/ORIG/F3C/JGYF/IB226ATC/F3CJGYFIB226ATC.jpg")
        return [FoodModelView(food: apples), FoodModelView(food: noodles), FoodModelView(food: spaghetti)]
    }()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


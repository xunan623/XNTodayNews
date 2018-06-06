//
//  AppDelegate.swift
//  XNTodayNews
//
//  Created by Dandre on 2018/6/6.
//  Copyright © 2018年 Dandre. All rights reserved.
//

import UIKit
import SwiftTheme

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // 设置主题颜色
        ThemeManager.setTheme(plistName: UserDefaults.standard.bool(forKey: isNight) ? "night_theme" : "default_theme" , path: .mainBundle)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = XNTabBarController()
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }


}


//
//  AppDelegate.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/10.
//  Copyright © 2017年 zhangli. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 设置导航条和工具条的外观
//        // 因为外观一旦设置全局有效, 所以应该在程序一进来就设置
//        UINavigationBar.appearance().tintColor = UIColor.orange
//        UITabBar.appearance().tintColor = UIColor.orange
        
        // 1.创建 window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        // 2.创建根控制器
        window?.rootViewController = defaultContoller()
        window?.makeKeyAndVisible()
        
//        print(isNewupdate())

        return true
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    /**
     用于获取默认界面
     
     :returns: 默认界面
     */
    fileprivate func defaultContoller() ->UIViewController
    {
        // 1.检测用户是不是第一次启动
        if !UserDefaults.standard.bool(forKey: ZLFirstLaunch) {
            UserDefaults.standard.set(true, forKey: ZLFirstLaunch)
            return ZLNewFeatureViewController()
        }
        
        return ZLTabBarController()
//        return isNewupdate() ? ZLNewFeatureViewController() : ZLTabBarController()
    }
    
    fileprivate func isNewupdate() -> Bool{
        // 1.获取当前软件的版本号 --> info.plist
        let currentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        
        // 2.获取以前的软件版本号 --> 从本地文件中读取(以前自己存储的)
        let sandboxVersion =  UserDefaults.standard.object(forKey: "CFBundleShortVersionString") as! String
        
        print("current = \(currentVersion) sandbox = \(sandboxVersion)")
        
        //   2.0                    1.0
        if currentVersion.compare(sandboxVersion) == ComparisonResult.orderedDescending {
            // 3.比较当前版本号和以前版本号
            UserDefaults.standard.set(currentVersion, forKey: "CFBundleShortVersionString")
            // 3.1.1 存储当前最新的版本号
            return true
        }
        
        return false
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


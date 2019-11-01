//
//  AppDelegate.swift
//  VSAC
//
//  Created by Jorge Medellin on 12/28/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit
//import AppCenter
//import AppCenterAnalytics
//import AppCenterCrashes
//import AppCenterPush
import HockeySDK
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Get details about last crash
//         var crashReport = MSCrashes.lastSessionCrashReport()
        //MSCrashes.hasCrashedInLastSession()
        // attach text file to report
//        func attachments(with crashes: MSCrashes, for errorReport: MSErrorReport) -> [MSErrorAttachmentLog] {
//            let attachment1 = MSErrorAttachmentLog.attachment(withText: "Hello World!!", filename: "hello.txt")
//            return [attachment1!]
//        }
        
        // App Center
//        MSAppCenter.setLogLevel(.verbose)
//        MSPush.setDelegate(self as? MSPushDelegate)
//        MSAppCenter.start("a13bed42-d505-4f08-acab-aefd176d0805", withServices:[
//            MSAnalytics.self,
//            MSCrashes.self,
//            MSPush.self
//            ])
        
        BITHockeyManager.shared().logLevel = BITLogLevel.debug
        
        BITHockeyManager.shared().configure(withIdentifier: "9dbf54d8ba7f44fc930894bae62f8ec1")
        BITHockeyManager.shared().crashManager.crashManagerStatus = BITCrashManagerStatus.autoSend
        BITHockeyManager.shared().start()
        BITHockeyManager.shared().authenticator.authenticateInstallation()
        
        return true
    }
    
//    func push(_ push: MSPush!, didReceive pushNotification: MSPushNotification!) {
//        let title: String = pushNotification.title ?? ""
//        var message: String = pushNotification.message ?? ""
//        var customData: String = ""
//        for item in pushNotification.customData {
//            customData =  ((customData.isEmpty) ? "" : "\(customData), ") + "\(item.key): \(item.value)"
//        }
//        if (UIApplication.shared.applicationState == .background) {
//            NSLog("Notification received in background, title: \"\(title)\", message: \"\(message)\", custom data: \"\(customData)\"");
//        } else {
//            message =  message + ((customData.isEmpty) ? "" : "\n\(customData)")
//
//            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
//
//            // Show the alert controller.
//            self.window?.rootViewController?.present(alertController, animated: true)
//        }
//    }

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


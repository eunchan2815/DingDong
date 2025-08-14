//
//  AppDelegate.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//

import UserNotifications
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .banner, .badge])
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        let identifier = response.notification.request.identifier
        print("알림을 탭함: \(identifier)")
        
        UNUserNotificationCenter.current().setBadgeCount(3) { error in
            if let error = error {
                print("Failed to set badge count: \(error)")
            } else {
                print("Badge count set successfully.")
            }
        }
        
        completionHandler()
    }
    
}

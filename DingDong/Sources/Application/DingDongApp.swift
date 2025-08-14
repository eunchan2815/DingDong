//
//  DingDongApp.swift
//  DingDong
//
//  Created by 김은찬 on 8/10/25.
//

import SwiftUI
import UserNotifications

@main
struct DingDongApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
            }
        }
    }
}

//
//  FirstLaunchManager.swift
//  DingDong
//
//  Created by 김은찬 on 8/11/25.
//

import Foundation

class FirstLaunchManager: ObservableObject {
    @Published var isFirstLaunch: Bool = true
    
    private let userDefaults = UserDefaults.standard
    private let firstLaunchKey = "isFirstLaunch"
    
    init() {
        checkFirstLaunch()
    }
    
    private func checkFirstLaunch() {
        isFirstLaunch = !userDefaults.bool(forKey: firstLaunchKey)
    }
    
    func completeFirstLaunch() {
        userDefaults.set(true, forKey: firstLaunchKey)
        isFirstLaunch = false
    }
    
    //MARK: Test
    func resetToFirstLaunch() {
        userDefaults.removeObject(forKey: firstLaunchKey)
        isFirstLaunch = true
    }
}

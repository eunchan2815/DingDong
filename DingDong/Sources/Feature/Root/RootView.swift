//
//  RootView.swift
//  DingDong
//
//  Created by 김은찬 on 8/10/25.
//

import SwiftUI

struct RootView: View {
    @StateObject private var firstLaunchManager = FirstLaunchManager()
    
    var body: some View {
        if firstLaunchManager.isFirstLaunch {
            SplashView {
                withAnimation(.easeInOut(duration: 0.5)) {
                    firstLaunchManager.completeFirstLaunch()
                }
            }
        } else {
            DingDongTabbar(viewModel: firstLaunchManager)
        }
    }
}

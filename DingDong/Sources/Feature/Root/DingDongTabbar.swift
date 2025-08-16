//
//  DingDongTabbar.swift
//  DingDong
//
//  Created by 김은찬 on 8/11/25.
//

import SwiftUI
import OpenTDS

struct DingDongTabbar: View {
    @ObservedObject var viewModel: FirstLaunchManager
    var body: some View {
        TossTabView {
            HomeView()
                .tossTabItem("홈", Image(systemName: "house.fill"))
            AlarmView()
                .tossTabItem("알람", Image(systemName: "alarm.fill"))
            SettingView(
                viewModel: viewModel
            )
            .tossTabItem("설정", Image(systemName: "gearshape.fill"))
        }
    }
}

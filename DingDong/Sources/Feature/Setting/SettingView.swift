//
//  SettingView.swift
//  DingDong
//
//  Created by 김은찬 on 8/11/25.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var viewModel: FirstLaunchManager
    var body: some View {
        DefaultView("Setting") {
            ScrollView {
                VStack {
                    Button {
                        viewModel.resetToFirstLaunch()
                    } label: {
                        Text("리셋")
                    }
                }
            }
        }
    }
}

//
//  TimerView.swift
//  DingDong
//
//  Created by 김은찬 on 8/11/25.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var provider = DingdongModalProvider()
    
    var body: some View {
        ZStack {
            DefaultView("Timer") {
                ScrollView {
                    VStack(spacing: 20) {
                        Button("타이머 맞추기") {
                            provider.present(
                                .init(
                                    title: "Title",
                                    message: "Description goes here.",
                                    primaryButton: .init("네") {},
                                    secondaryButton: .init("아니요") {}
                                )
                            )
                        }
                    }
                }
                .padding()
            }
            DingdongModal(provider: provider) {}
        }
    }
}

#Preview {
    TimerView()
}

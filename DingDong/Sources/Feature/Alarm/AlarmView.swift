//
//  AlarmView.swift
//  DingDong
//
//  Created by 김은찬 on 8/11/25.
//

import SwiftUI

struct AlarmView: View {
    var body: some View {
        DefaultView("Alarm") {
            ScrollView {}
                .overlay(alignment: .bottomTrailing) {
                    PlusButton {}
                }
                .padding(.bottom, 60)
                .padding(.horizontal, 24)
        }
    }
}

#Preview {
    AlarmView()
}

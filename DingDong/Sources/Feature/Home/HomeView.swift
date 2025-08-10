//
//  HomeView.swift
//  DingDong
//
//  Created by 김은찬 on 8/11/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        DefaultView("Home") {
            ScrollView {
                HStack {
                    Text("최근 설정한 알람")
                        .font(.bold(20))
                    Spacer()
                }
            }
            .padding(.horizontal, 14)
        }
    }
}

#Preview {
    HomeView()
}

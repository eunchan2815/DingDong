//
//  DingDongHeader.swift
//  DingDong
//
//  Created by 김은찬 on 8/11/25.
//

import SwiftUI

struct DefaultView<Content: View>: View {
    let content: Content
    let pageName: String
    
    init(_ pageName: String, @ViewBuilder content: () -> Content) {
        self.pageName = pageName
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text(pageName)
                        .font(.mainBold(40))
                        .foregroundStyle(Color.main)
                    Spacer()
                }
                .frame(height: 50)
                .padding(.horizontal, 14)
                content
                    .padding(.vertical, 4)
            }
        }
    }
}

#Preview {
    DefaultView("Home") {
        HomeView()
    }
}

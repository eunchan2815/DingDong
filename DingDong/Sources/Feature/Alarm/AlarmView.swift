//
//  AlarmView.swift
//  DingDong
//
//  Created by 김은찬 on 8/11/25.
//

import SwiftUI

import SwiftUI

struct AlarmView: View {
    @State private var isShowing = false
    
    var body: some View {
        DefaultView("Alarm") {
            ScrollView { }
                .overlay(alignment: .bottomTrailing) {
                    PlusButton {
                        isShowing = true
                    }
                }
                .padding(.bottom, 60)
                .padding(.horizontal, 24)
                .sheet(isPresented: $isShowing) {
                    SheetItemView()
                        .presentationDetents([.height(600)])
                        .presentationDragIndicator(.visible)
                        .presentationCornerRadius(20)
                }
        }
    }
}

#Preview {
    AlarmView()
}

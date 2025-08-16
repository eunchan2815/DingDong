//
//  AlarmView.swift
//  DingDong
//
//  Created by 김은찬 on 8/11/25.
//

import SwiftUI
import RealmSwift

struct AlarmView: View {
    @ObservedResults(AlarmObject.self) var alarms
    @State private var isShowing = false
    
    var body: some View {
        DefaultView("Alarm") {
            ScrollView {
                if alarms.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "alarm")
                            .font(.system(size: 40, weight: .medium))
                            .foregroundColor(.gray)
                        Text("등록된 알람이 없습니다")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, minHeight: 400)
                } else {
                    VStack(spacing: 16) {
                        ForEach(alarms) { alarm in
                            AlarmItem(alarm: alarm)
                        }
                    }
                    .padding(.vertical, 16)
                }
            }
            .overlay(alignment: .bottomTrailing) {
                PlusButton {
                    isShowing = true
                }
            }
            .padding(.bottom, 60)
            .padding(.horizontal, 24)
            .sheet(isPresented: $isShowing) {
                SheetItemView()
                    .interactiveDismissDisabled(true)
                    .ignoresSafeArea(.keyboard)
                    .presentationDetents([.height(600)])
                    .presentationDragIndicator(.visible)
                    .presentationCornerRadius(20)
            }
        }
    }
}

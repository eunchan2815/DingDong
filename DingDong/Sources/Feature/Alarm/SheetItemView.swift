//
//  SheetItemView.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//

import SwiftUI

struct SheetItemView: View {
    @StateObject private var viewModel = DateSelectionViewModel(selectedDate: Date())
    @StateObject private var alarmManager = AlarmNotificationManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var step = 0
    @State private var showingAlert = false
    
    @State private var hour = Calendar.current.component(.hour, from: Date())
    @State private var minute = Calendar.current.component(.minute, from: Date())
    
    var body: some View {
        ZStack {
            if step == 0 {
                DateSelectionView(viewModel: viewModel) {
                    dismiss()
                } onSave: {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        step = 1
                    }
                }
                .transition(.asymmetric(
                    insertion: .move(edge: .leading).combined(with: .opacity),
                    removal: .move(edge: .leading).combined(with: .opacity)
                ))
                .zIndex(step == 0 ? 1 : 0)
            }
            
            if step == 1 {
                TimeSelectionView(
                    hour: $hour,
                    minute: $minute,
                    onCancel: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            step = 0
                        }
                    },
                    onNext: {
                        Task {
                            await setupAlarm()
                        }
                        dismiss()
                    }
                )
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal: .move(edge: .trailing).combined(with: .opacity)
                ))
                .zIndex(step == 1 ? 1 : 0)
            }
        }
        .padding(.horizontal)
        .clipped()
        .task {
            let granted = await alarmManager.requestNotificationPermission()
            if !granted {
                print("알림 권한이 거부되었습니다.")
            }
        }
    }
    
    private func setupAlarm() async {
        let koreanTimeZone = TimeZone(identifier: "Asia/Seoul")!
        var calendar = Calendar.current
        calendar.timeZone = koreanTimeZone
        
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: viewModel.selectedDate)
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.timeZone = koreanTimeZone
        
        if let finalDate = calendar.date(from: dateComponents) {
            if finalDate <= Date() {
                return
            }
            
            await alarmManager.scheduleAlarm(
                for: finalDate,
                title: "딩동~",
                body: "설정한 알람이 왔어요"
            )
        }
    }
}

#Preview {
    SheetItemView()
}

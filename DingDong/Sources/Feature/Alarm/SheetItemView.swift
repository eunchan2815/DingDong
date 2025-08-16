//
//  SheetItemView.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//

import SwiftUI
import RealmSwift

struct SheetItemView: View {
    @StateObject private var viewModel = DateSelectionViewModel(selectedDate: Date())
    @StateObject private var alarmManager = AlarmNotificationManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var step = 0
    
    @State private var hour = Calendar.current.component(.hour, from: Date())
    @State private var minute = Calendar.current.component(.minute, from: Date())
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        ZStack {
            if step == 0 {
                DateSelectionView(viewModel: viewModel) {
                    dismiss()
                } onSave: {
                    withAnimation(.easeInOut) { step = 1 }
                }
            }
            
            if step == 1 {
                TimeSelectionView(
                    hour: $hour,
                    minute: $minute,
                    selectedDate: viewModel.selectedDate,
                    onCancel: {
                        withAnimation(.easeInOut) { step = 0 }
                    },
                    onNext: {
                        withAnimation(.easeInOut) { step = 2 }
                    }
                )
            }
            
            if step == 2 {
                TitleDescriptionView(title: $title, description: $description) {
                    withAnimation(.easeInOut) { step = 1 }
                } onSave: {
                    Task { await setupAlarm() }
                    
                    let alarmDate = makeAlarmDate()
                    
                    let newAlarm = AlarmObject()
                    newAlarm.date = alarmDate
                    newAlarm.alarmTitle = title.isEmpty ? "딩동" : title
                    newAlarm.alarmDescription = description.isEmpty ? "설정한 알람이 울려요" : description
                    newAlarm.isEnabled = true
                    
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(newAlarm)
                    }
                    
                    dismiss()
                }
            }
        }
        .padding(.horizontal, 8)
        .clipped()
        .task {
            let granted = await alarmManager.requestNotificationPermission()
            if !granted { print("알림 권한이 거부되었습니다.") }
        }
    }
    
    private func makeAlarmDate() -> Date {
        let koreanTimeZone = TimeZone(identifier: "Asia/Seoul")!
        var calendar = Calendar.current
        calendar.timeZone = koreanTimeZone
        
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: viewModel.selectedDate)
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.timeZone = koreanTimeZone
        
        return calendar.date(from: dateComponents) ?? Date()
    }
    
    private func setupAlarm() async {
        let alarmDate = makeAlarmDate()
        if alarmDate <= Date() { return }
        
        await alarmManager.scheduleAlarm(
            for: alarmDate,
            title: title.isEmpty ? "딩동" : title,
            body: description.isEmpty ? "설정한 알람이 울려요" : description
        )
    }
}


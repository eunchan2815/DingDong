//
//  CustomAlarmSheet.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//

import SwiftUI

struct CustomAlarmSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentStep: AlarmStep = .timeSelection
    @State private var selectedHour: Int = 8
    @State private var selectedMinute: Int = 30
    @State private var selectedDate = Date()
    
    enum AlarmStep {
        case timeSelection
        case dateSelection
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .ignoresSafeArea()
                .onTapGesture {
                    dismiss()
                }
            
//            VStack {
//                Spacer()
//                
//                // Custom Sheet Container
//                VStack(spacing: 0) {
//                    if currentStep == .timeSelection {
//                        TimeSelectionView(
//                            hour: $selectedHour,
//                            minute: $selectedMinute,
//                            onCancel: { dismiss() },
//                            onNext: { currentStep = .dateSelection }
//                        )
//                    } else {
//                        DateSelectionView(
//                            selectedDate: $selectedDate,
//                            onCancel: { currentStep = .timeSelection },
//                            onSave: {
//                                saveAlarm()
//                                dismiss()
//                            }
//                        )
//                    }
//                }
//                .background(Color(.systemBackground))
//                .cornerRadius(20)
//                .padding(.horizontal, 20)
//                .padding(.bottom, 40)
//            }
        }
        .transition(.opacity)
    }
    
    private func saveAlarm() {
        let calendar = Calendar.current
        let finalDate = calendar.date(bySettingHour: selectedHour,
                                      minute: selectedMinute,
                                      second: 0,
                                      of: selectedDate) ?? Date()
        
        print("알람 저장 - 시간: \(selectedHour):\(selectedMinute), 날짜: \(selectedDate)")
        // TODO: 실제 알람 저장 로직
    }
}



// MARK: - Main View
struct MainViewWithCustomSheet: View {
    @State private var showingAlarmCreation = false
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Text("딩동")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
                
                Text("알람이 없습니다")
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    AnimationButton {
                        showingAlarmCreation = true
                    } label: {
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 60, height: 60)
                            .overlay {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .shadow(color: .orange.opacity(0.3), radius: 8, x: 0, y: 4)
                    }
                    .padding(.trailing, 30)
                    .padding(.bottom, 30)
                }
            }
        }
        .overlay {
            if showingAlarmCreation {
                CustomAlarmSheet()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: showingAlarmCreation)
    }
}

#Preview {
    MainViewWithCustomSheet()
}

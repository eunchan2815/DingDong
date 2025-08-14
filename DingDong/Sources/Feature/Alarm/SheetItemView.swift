//
//  SheetItemView.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//

import SwiftUI

struct SheetItemView: View {
    @StateObject private var viewModel = DateSelectionViewModel(selectedDate: Date())
    @Environment(\.dismiss) var dismiss
    @State private var step = 0
    
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
                        let calendar = Calendar.current
                        var dateComponents = calendar.dateComponents([.year, .month, .day], from: viewModel.selectedDate)
                        dateComponents.hour = hour
                        dateComponents.minute = minute
                        
                        if let finalDate = calendar.date(from: dateComponents) {
                            print("최종 알람 시간: \(finalDate)")
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
    }
}

#Preview {
    SheetItemView()
}

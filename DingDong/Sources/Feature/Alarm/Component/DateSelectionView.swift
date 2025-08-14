//
//  DateSelectionView.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//

import SwiftUI

struct DateSelectionView: View {
    @ObservedObject var viewModel: DateSelectionViewModel
    let onCancel: () -> Void
    let onSave: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            HStack(alignment: .center) {
                Text("알람 받을 날짜를 선택해주세요.")
                    .font(.bold(20))
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                HStack {
                    Circle()
                        .fill(Color.main)
                        .frame(width: 8, height: 8)
                    Circle()
                        .fill(.gray.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.horizontal, 20)
            
            VStack(spacing: 20) {
                HStack {
                    Button(action: viewModel.previousMonth) { Image(systemName: "chevron.left") }
                    Spacer()
                    Text(viewModel.monthYearString).font(.bold(18))
                    Spacer()
                    Button(action: viewModel.nextMonth) { Image(systemName: "chevron.right") }
                }
                .foregroundColor(Color.label)
                .padding(.horizontal, 30)
                .padding(.top, 30)
                
                DingdongDivider().padding(.horizontal, 14)
                
                HStack {
                    ForEach(["월","화","수","목","금","토","일"], id: \.self) { day in
                        Text(day).font(.medium(16)).foregroundColor(.gray).frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal, 30)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                    ForEach(Array(viewModel.calendarDays.enumerated()), id: \.offset) { _, day in
                        if day == 0 {
                            Text("").frame(width: 35, height: 35)
                        } else {
                            AnimationButton {
                                viewModel.select(day)
                                print(day)
                            } label: {
                                Text("\(day)")
                                    .font(.regular(18))
                                    .foregroundColor(viewModel.isSelected(day) ? .white : .primary)
                                    .frame(width: 35, height: 35)
                                    .background(
                                        Circle().fill(viewModel.isSelected(day) ? Color.main : Color.clear)
                                    )
                            }
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 60)
            }
            
            Spacer()
            
            SheetButton() {
                onSave()
            } onCancel: {
                onCancel()
            }
        }
        .frame(height: 580)
    }
}


struct PreviewTest: View {
    @StateObject private var viewModel = DateSelectionViewModel(selectedDate: Date())
    
    var body: some View {
        DateSelectionView(viewModel: viewModel) {
            
        } onSave: {
            
        }
    }
}

#Preview {
    PreviewTest()
}


//
//  TimeSelectionView.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//

import SwiftUI

struct TimeSelectionView: View {
    @Binding var hour: Int
    @Binding var minute: Int
    let onCancel: () -> Void
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                HStack(alignment: .center) {
                    Text("알람 받을 시간을 선택해주세요.")
                        .font(.bold(20))
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    HStack {
                        Circle()
                            .fill(.gray.opacity(0.3))
                            .frame(width: 8, height: 8)
                        Circle()
                            .fill(Color.main)
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)
                
                VStack(spacing: 20) {
                    Spacer().frame(height: 70)
                    
                    HStack(spacing: 10) {
                        Picker("Hour", selection: $hour) {
                            ForEach(0..<24, id: \.self) { hour in
                                Text("\(hour)시")
                                    .font(.medium(20))
                                    .foregroundColor(.primary)
                                    .tag(hour)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 150)
                        .clipped()
                        
                        Picker("Minute", selection: $minute) {
                            ForEach(0..<60, id: \.self) { minute in
                                Text("\(minute)분")
                                    .font(.medium(20))
                                    .foregroundColor(.primary)
                                    .tag(minute)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 150)
                        .clipped()
                    }
                    .labelsHidden()
                    .frame(height: 180)
                    .frame(maxWidth: .infinity)
                    .background(Color.init(uiColor: .systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .opacity(0.95)
                    .padding(.horizontal, 30)
                    
                    Spacer().frame(height: 60)
                }
            }
            
            Spacer()
            
            SheetButton() {
                onNext()
            } onCancel: {
                onCancel()
            }
        }
        .frame(height: 580)
    }
}

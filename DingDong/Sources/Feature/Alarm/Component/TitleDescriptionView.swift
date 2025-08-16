//
//  TitleDescriptionView.swift
//  DingDong
//
//  Created by 김은찬 on 8/16/25.
//

import SwiftUI

struct TitleDescriptionView: View {
    @Binding var title: String
    @Binding var description: String
    let onCancel: () -> Void
    let onSave: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                HStack {
                    Text("알람 제목과 설명을 입력해주세요.")
                        .font(.bold(20))
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    HStack {
                        Circle()
                            .fill(.gray.opacity(0.3))
                            .frame(width: 8, height: 8)
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
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 2) {
                            Text("제목")
                                .font(.medium(16))
                                .foregroundColor(.secondary)
                            Text("*")
                                .font(.medium(16))
                                .foregroundColor(.red)
                        }
                        
                        TextField("알람 제목을 입력하세요", text: $title)
                            .padding(12)
                            .background(Color(uiColor: .systemGray6))
                            .clipShape(size: 12)
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("설명")
                            .font(.medium(16))
                            .foregroundColor(.secondary)
                        
                        TextField("설명을 입력하세요", text: $description)
                            .padding(12)
                            .background(Color(uiColor: .systemGray6))
                            .clipShape(size: 12)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 40)
            }
            
            Spacer()
            
            SheetButton(
                onNext: {
                    onSave()
                },
                onCancel: {
                    onCancel()
                },
                isNextDisabled: title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            )
        }
        .scrollDisabled(true)
        .ignoresSafeArea(.keyboard)
        .frame(height: 580)
    }
}

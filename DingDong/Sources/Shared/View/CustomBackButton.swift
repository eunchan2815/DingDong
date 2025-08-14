//
//  CustomBackButton.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//


import SwiftUI

struct CustomBackButton: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(Color.foreground)
                                .font(.bold(16))
                        }
                    }
                }
            }
    }
}

extension View {
    func BarbellBackButton(
    ) -> some View {
        self.modifier(CustomBackButton())
    }
}
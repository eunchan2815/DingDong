//
//  SheetButton.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//

import SwiftUI

struct SheetButton: View {
    let onNext: () -> Void
    let onCancel: () -> Void
    var body: some View {
        HStack(spacing: 12) {
            AnimationButton {
                onCancel()
            } label: {
                Text("취소")
                    .font(.bold(16))
                    .foregroundColor(.black.opacity(0.5))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color(.systemGray5))
                    .clipShape(size: 12)
            }
            
            AnimationButton {
                onNext()
            } label: {
                Text("다음")
                    .font(.bold(16))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.main)
                    .clipShape(size: 12)
            }
        }
        .padding(.horizontal, 14)
    }
}

#Preview {
    SheetButton {} onCancel: {}
}

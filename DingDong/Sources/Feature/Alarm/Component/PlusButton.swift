//
//  PlusButton.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//

import SwiftUI

struct PlusButton: View {
    let action: () -> Void
    var body: some View {
        AnimationButton {
            action()
        } label: {
            Circle()
                .fill(Color.main)
                .frame(width: 60, height: 60)
                .overlay {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.white)
                        .font(.bold(5))
                }
        }
    }
}

#Preview {
    PlusButton() {
        
    }
}

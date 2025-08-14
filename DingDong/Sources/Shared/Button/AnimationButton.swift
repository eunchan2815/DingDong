//
//  AnimationButton.swift
//  DingDong
//
//  Created by 김은찬 on 8/14/25.
//


import SwiftUI

struct AnimationButton<Label: View>: View {
    let action: () -> Void
    let label: Label
    
    @State private var isPressed = false
    
    init(action: @escaping () -> Void, @ViewBuilder label: () -> Label) {
        self.action = action
        self.label = label()
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            label
        }
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.spring(response: 0.2, dampingFraction: 0.8, blendDuration: 0), value: isPressed)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
        .buttonStyle(.plain)
    }
}

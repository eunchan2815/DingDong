//
//  CustomToggleStyle.swift
//  DingDong
//
//  Created by 김은찬 on 8/12/25.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 52, height: 32)
                .foregroundColor(configuration.isOn ? .blue : .gray.opacity(0.3))
                .overlay(
                    Circle()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.white)
                        .offset(x: configuration.isOn ? 10 : -10)
                        .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

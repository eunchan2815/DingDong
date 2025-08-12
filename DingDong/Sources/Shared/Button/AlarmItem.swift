//
//  AlarmItem.swift
//  DingDong
//
//  Created by 김은찬 on 8/12/25.
//

import SwiftUI

struct AlarmItem: View {
    @Binding var isEnabled: Bool
    let date: String
    let time: String
    
    var body: some View {
        ZStack {
            VStack {
                Color.clear
                    .frame(height: 50)
                HStack {
                    Image(.clock)
                    Spacer()
                }
                .padding(.trailing, 240)
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(date)")
                        .font(.medium(16))
                    
                    Text("\(time)")
                        .font(.bold(28))
                }
                
                Spacer()
                
                Toggle("", isOn: $isEnabled)
                    .toggleStyle(CustomToggleStyle())
                    .scaleEffect(0.8)
            }
            .padding(.horizontal, 40)
        }
        .frame(width: 360, height: 120)
        .background(Color.white)
        .clipShape(size: 20)
    }
}

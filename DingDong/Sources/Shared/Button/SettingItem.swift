//
//  SettingItem.swift
//  DingDong
//
//  Created by 김은찬 on 8/12/25.
//

import SwiftUI

struct SettingItem: View {
    let imageName: String
    let title: String
    let description: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                HStack {
                    //                Circle()
                    //                    .fill(.gray.opacity(0.15))
                    //                    .frame(width: 45, height: 45)
                    //                    .overlay {
                    Image(imageName)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(Color.foreground)
                    //                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(title)
                            .font(.bold(16))
                            .foregroundStyle(Color.foreground)
                        
                        Text(description)
                            .font(.medium(14))
                            .foregroundStyle(.gray)
                    }
                    .padding(.leading, 2)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray)
                }
            }
            .padding(18)
            .background(.white)
            .clipShape(size: 12)
            .padding(.horizontal, 16)
        }
    }
}

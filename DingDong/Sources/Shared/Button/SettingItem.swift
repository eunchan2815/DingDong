//
//  SettingItem.swift
//  DingDong
//
//  Created by 김은찬 on 8/12/25.
//

import SwiftUI

struct SettingItem: View {
    let systemName: String?
    let imageName: String?
    let title: String
    let description: String
    let action: () -> Void
    
    init(systemName: String, title: String, description: String, action: @escaping () -> Void) {
        self.systemName = systemName
        self.imageName = nil
        self.title = title
        self.description = description
        self.action = action
    }
    
    init(imageName: String, title: String, description: String, action: @escaping () -> Void) {
        self.systemName = nil
        self.imageName = imageName
        self.title = title
        self.description = description
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                HStack {
                    if let systemName = systemName {
                        Image(systemName: systemName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .foregroundStyle(Color.black)
                            .padding(.horizontal, 8)
                    } else if let imageName = imageName {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.black)
                            .padding(.horizontal, 8)
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(title)
                            .font(.bold(14))
                            .foregroundStyle(Color.foreground)
                        
                        Text(description)
                            .font(.medium(12))
                            .foregroundStyle(.gray)
                    }
                    .padding(.leading, 2)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray)
                }
            }
            .padding(14)
            .background(.white)
            .clipShape(size: 12)
            .padding(.horizontal, 16)
        }
    }
}

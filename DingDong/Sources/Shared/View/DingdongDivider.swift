//
//  Divider.swift
//  DingDong
//
//  Created by 김은찬 on 8/12/25.
//

import SwiftUI

struct DingdongDivider: View {
    var body: some View {
        Rectangle()
            .fill(.gray.opacity(0.15))
            .frame(maxWidth: .infinity, maxHeight: 1)
            .padding(.horizontal, 20)
    }
}

#Preview {
    DingdongDivider()
}

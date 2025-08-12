//
//  Shape.swift
//  DingDong
//
//  Created by 김은찬 on 8/12/25.
//


import SwiftUI

public extension View {
    func clipShape(size: CGFloat) -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: size))
    }
}

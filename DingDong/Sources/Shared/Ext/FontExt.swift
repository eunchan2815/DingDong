//
//  FontExt.swift
//  Barbell
//
//  Created by 김은찬 on 6/25/25.
//

import SwiftUI

enum CustomFont: String {
    case semiBold = "Pretendard-SemiBold"
    case medium = "Pretendard-Medium"
    case bold = "Pretendard-Bold"
    case regular = "Pretendard-Regular"
    case mainBold = "TTPinkfongBabySharkB"
    case mainRegular = "TTPinkfongBabySharkR"
    case mainLight = "TTPinkfongBabySharkL"
}

public extension Font {
    private static func customFont(_ weight: CustomFont, _ size: CGFloat) -> Self {
        Font.custom(weight.rawValue, size: size)
    }
    
    static func regular(_ size: CGFloat) -> Self {
        Font.customFont(.regular, size)
    }
    
    static func medium(_ size: CGFloat) -> Self {
        Font.customFont(.medium, size)
    }
    
    static func bold(_ size: CGFloat) -> Self {
        Font.customFont(.bold, size)
    }
    
    static func semiBold(_ size: CGFloat) -> Self {
        Font.customFont(.semiBold, size)
    }
    
    static func mainBold(_ size: CGFloat) -> Self {
        Font.customFont(.mainBold, size)
    }
    
    static func mainRegular(_ size: CGFloat) -> Self {
        Font.customFont(.mainRegular, size)
    }
    
    static func mainLight(_ size: CGFloat) -> Self {
        Font.customFont(.mainLight, size)
    }
}

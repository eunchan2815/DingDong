//
//  SettingView.swift
//  DingDong
//
//  Created by 김은찬 on 8/11/25.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var viewModel: FirstLaunchManager
    @Environment(\.openURL) private var openURL
    var body: some View {
        DefaultView("Setting") {
            ScrollView {
                VStack(spacing: 12) {
                    HStack {
                        Text("지원 및 정보")
                            .font(.bold(20))
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    SettingItem(
                        systemName: "questionmark.circle",
                        title: "기능 지원",
                        description: "사용법 및 기능안내"
                    ) {
                        //MARK: 명세서 쓰기
                    }
                    SettingItem(
                        imageName: "Notion",
                        title: "도움말",
                        description: "Notion 페이지로 이동"
                    ) {
                        if let url = URL(string: "https://www.notion.so/177cba4137ad80c78dd7e91a19d7f19e") {
                            openURL(url)
                        }
                    }
                    SettingItem(
                        imageName: "Github",
                        title: "개발자",
                        description: "GitHub 프로필 보기"
                    ) {
                        if let url = URL(string: "https://github.com/eunchan2815") {
                            openURL(url)
                        }
                    }
                    
                    SettingItem(
                        systemName: "star",
                        title: "앱 평가하기",
                        description: "App store에서 평가남기기"
                    ) {
                        //MARK: 앱 배포후 구현
                    }
                    .padding(.vertical, 8)
                    
                    DingdongDivider()
                    
                    HStack {
                        Text("기타")
                            .font(.bold(20))
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    SettingItem(
                        systemName: "trash",
                        title: "앱 캐시 삭제",
                        description: "앱 캐시 데이터 삭제"
                    ) {
                        viewModel.resetToFirstLaunch()
                    }
                }
            }
        }
    }
}

//
//  SplashView.swift
//  DingDong
//
//  Created by 김은찬 on 8/10/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isAnimating = false
    @State private var textScale: CGFloat = 0
    @State private var showContinueButton = false
    @State private var showSubtitle = false
    let onContinue: () -> Void
    
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
            
            RadialGradient(
                colors: [
                    Color.white.opacity(isAnimating ? 0.3 : 0),
                    Color.clear
                ],
                center: .center,
                startRadius: 0,
                endRadius: isAnimating ? 300 : 100
            )
            .animation(.easeOut(duration: 2.0), value: isAnimating)
            
            VStack {
                Spacer()
                
                VStack(spacing: 4) {
                    Text("딩동")
                        .font(.mainBold(150))
                        .foregroundStyle(Color.white)
                        .scaleEffect(textScale)
                        .animation(.bouncy(duration: 1.0, extraBounce: 0.2).delay(0.3), value: textScale)
                    
                    Text("알람을 간편하게")
                        .font(.mainRegular(40))
                        .foregroundColor(Color.white.opacity(0.9))
                        .opacity(showSubtitle ? 1.0 : 0)
                        .offset(y: showSubtitle ? 0 : 20)
                        .animation(.easeOut(duration: 0.8), value: showSubtitle)
                }
                
                Spacer()
                
                if showContinueButton {
                    VStack(spacing: 12) {
                        Image(systemName: "chevron.up")
                            .font(.title2)
                            .foregroundColor(Color.white.opacity(0.8))
                            .offset(y: isAnimating ? -5 : 5)
                            .animation(
                                .easeInOut(duration: 1.0)
                                .repeatForever(autoreverses: true),
                                value: isAnimating
                            )
                        
                        Button {
                            
                        } label: {
                            VStack(spacing: 12) {
                                Text("터치하여 시작하기")
                                    .font(.medium(18))
                                    .foregroundColor(Color.white)
                                
                                ZStack {
                                    Circle()
                                        .fill(Color.white.opacity(0.2))
                                        .frame(width: 60, height: 60)
                                        .scaleEffect(isAnimating ? 1.2 : 1.0)
                                        .opacity(isAnimating ? 0.3 : 0.6)
                                    
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                        .frame(width: 50, height: 50)
                                    
                                    Image(systemName: "hand.tap")
                                        .font(.title2)
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .scaleEffect(showContinueButton ? 1.0 : 0.8)
                        .opacity(showContinueButton ? 1.0 : 0)
                        .animation(.easeOut(duration: 0.6).delay(0.2), value: showContinueButton)
                    }
                    .padding(.bottom, 80)
                }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if showContinueButton {
                onContinue()
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.1)) {
                textScale = 1.3
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.easeOut(duration: 0.4)) {
                    textScale = 1.0
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                showSubtitle = true
            }
            
            withAnimation(.easeInOut(duration: 0.8).delay(0.5)) {
                isAnimating = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeInOut(duration: 0.8)) {
                    showContinueButton = true
                }
            }
        }
    }
}

#Preview("Alternative Version") {
    SplashView {
        
    }
}

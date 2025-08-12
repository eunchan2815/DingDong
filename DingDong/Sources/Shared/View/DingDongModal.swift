import SwiftUI

public struct DingdongModal<C: View>: View {
    
    @StateObject private var provider: DingdongModalProvider
    let content: () -> C
    
    public init(
        provider: DingdongModalProvider,
        @ViewBuilder content: @escaping () -> C
    ) {
        self._provider = .init(wrappedValue: provider)
        self.content = content
    }
    
    func dismiss() {
        withAnimation {
            provider.isPresent = false
        }
    }
    
    public var body: some View {
        ZStack {
            content()
            
            if let modal = provider.modal, provider.isPresent {
                Color.clear
                    .contentShape(Rectangle())
                    .ignoresSafeArea()
                    .onTapGesture { dismiss() }
                    .transition(.opacity)
                
                VStack(spacing: 16) {
                    Text(modal.title)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if let message = modal.message {
                        Text(message)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack(spacing: 12) {
                        if let secondaryButton = modal.secondaryButton {
                            Button {
                                secondaryButton.action()
                                dismiss()
                            } label: {
                                Text(secondaryButton.title)
                                    .font(.system(size: 16, weight: .bold))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .background(Color.gray.opacity(0.1))
                                    .foregroundColor(.black)
                                    .cornerRadius(12)
                            }
                        }
                        
                        if let primaryButton = modal.primaryButton {
                            Button {
                                primaryButton.action()
                                dismiss()
                            } label: {
                                Text(primaryButton.title)
                                    .font(.system(size: 16, weight: .bold))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .background(Color(red: 0.36, green: 0.56, blue: 0.91))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                        }
                    }
                }
                .padding(20)
                .frame(maxWidth: 320)
                .background(Color.white)
                .cornerRadius(20)
                .transition(.asymmetric(
                    insertion: AnyTransition.opacity.combined(with: .scale(scale: 1.1))
                        .animation(.spring(response: 0.4, dampingFraction: 0.7)),
                    removal: AnyTransition.opacity.combined(with: .scale(scale: 0.9))
                        .animation(.easeOut(duration: 0.2))
                ))
            }
        }
    }
}

// MARK: - Provider
public final class DingdongModalProvider: ObservableObject {
    @Published var isPresent: Bool = false
    @Published var modal: DingdongModalModel?
    
    public init() {}
    
    public func present(_ modal: DingdongModalModel) {
        withAnimation {
            self.modal = modal
            self.isPresent = true
        }
    }
}

// MARK: - Model
public struct DingdongModalModel {
    public struct ButtonModel {
        let title: String
        let action: () -> Void
        public init(_ title: String, action: @escaping () -> Void) {
            self.title = title
            self.action = action
        }
    }
    
    let title: String
    let message: String?
    let primaryButton: ButtonModel?
    let secondaryButton: ButtonModel?
    
    public init(title: String, message: String? = nil,
                primaryButton: ButtonModel? = nil,
                secondaryButton: ButtonModel? = nil) {
        self.title = title
        self.message = message
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
    }
}

#Preview {
    struct DingdongPreview: View {
        @StateObject private var provider = DingdongModalProvider()
        var body: some View {
            DingdongModal(provider: provider) {
                VStack(spacing: 20) {
                    Button("Show Modal") {
                        provider.present(
                            .init(
                                title: "Title",
                                message: "Description goes here.",
                                primaryButton: .init("네") { print("네 클릭") },
                                secondaryButton: .init("아니요") { print("아니요 클릭") }
                            )
                        )
                    }
                }
                .padding()
            }
        }
    }
    return DingdongPreview()
}

import SwiftUI

struct ErrorView: View {
    let retryButton: () -> Void
    let helpCenterButton: () -> Void
    
    var body: some View {
        contentView()
            .toolbar(.hidden, for: .navigationBar)
    }
}

private extension ErrorView {
    
    @ViewBuilder
    func contentView() -> some View {
        ZStack {
            Image("HPBackground")
                .resizable()
                .ignoresSafeArea()
            
            Image("HPErrorScreen")
                .resizable()
            
                VStack(alignment: .center, spacing: 16) {
                    Spacer()
                    Button(Defaults.errorButtonRetry, action: retryButton)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: Defaults.buttonHeight)
                        .foregroundColor(Color("HPRed"))
                        .background(Color("HPYellow"))
                        .cornerRadius(Defaults.cornerRadius)
                    
                    Button(Defaults.errorButtonHelpCenter, action: helpCenterButton)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: Defaults.buttonHeight)
                        .foregroundColor(Color("HPRed"))
                        .background(Color("HPYellow"))
                        .cornerRadius(Defaults.cornerRadius)
                    
                    Spacer()
                        .frame(height: 20)
                }
                .padding([.top, .leading, .trailing], 24)
        }
    }
}

private extension ErrorView {
    enum Defaults {
        static let errorButtonRetry = "Retry Again"
        static let errorButtonHelpCenter = "Visit our help center"
        
        static let imageWidth: CGFloat = 250
        static let imageHeight: CGFloat = 250
        
        static let cornerRadius: CGFloat = 8
        static let buttonHeight: CGFloat = 48
    }
}

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
            
            VStack(alignment: .center, spacing: 32) {
                Spacer()
                VStack(alignment: .center, spacing: 16) {
                    Text(Defaults.errorMessageTitle)
                        .bold()
                    
                    Text(Defaults.errorMessageDescription)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                VStack(alignment: .center, spacing: 16) {
                    Button(Defaults.errorButtonRetry, action: retryButton)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: Defaults.buttonHeight)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(Defaults.cornerRadius)
                    
                    Button(Defaults.errorButtonHelpCenter, action: helpCenterButton)
                        .frame(maxWidth: .infinity)
                        .frame(height: Defaults.buttonHeight)
                        .foregroundColor(.blue)
                        .background(.white)
                        .overlay(RoundedRectangle(cornerRadius: Defaults.cornerRadius).stroke(.blue, lineWidth: 1))
                }
                Spacer()
                    .frame(height: 20)
            }
            .padding([.top, .leading, .trailing], 24)
        }
    }
}

private extension ErrorView {
    enum Defaults {
        static let errorMessageTitle = "Error Occured"
        static let errorMessageDescription = "We encountered an unexpected and serious error. Please try again or visit our help center."
        static let errorButtonRetry = "Retry Again"
        static let errorButtonHelpCenter = "Visit our help center"
        
        static let imageWidth: CGFloat = 250
        static let imageHeight: CGFloat = 250
        
        static let cornerRadius: CGFloat = 8
        static let buttonHeight: CGFloat = 48
    }
}

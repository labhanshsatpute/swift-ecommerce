import SwiftUI

struct ButtonSecondary: View {

    var handleClick: (() -> Void)?
    var leftIcon: String?
    var rightIcon: String?
    var text: String
    
    var body: some View {
        Button(action: {
            if let handleClick = handleClick {
                self.handleClick?()
            }
        }) {
            HStack {
                if let leftIcon = leftIcon {
                    Image(systemName: leftIcon)
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                }
                Text(text)
                    .font(.headline)
                    .fontWeight(.semibold)
                if let rightIcon = rightIcon {
                    Image(systemName: rightIcon)
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .padding(.horizontal, 20)
        }
        .background(Color.ascent.opacity(0.2))
        .foregroundColor(.ascentDark)
        .cornerRadius(10)
    }
}

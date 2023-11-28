import SwiftUI

struct InputBox: View {
    
    @Binding var text: String
    var placeHolder: String
    var label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(Color.black.opacity(0.7))
                .padding(.bottom, 3)
            TextField(placeHolder, text: $text)
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
        }
    }
}

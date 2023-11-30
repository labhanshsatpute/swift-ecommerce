import SwiftUI

struct NotificationButton: View {
    @State private var openNotification: Bool = false
    var body: some View {
        NavigationLink(destination: NotificationView(), isActive: $openNotification) {
                Button(action: {
                    openNotification = true
                }, label: {
                    Image(systemName: "bell")
                        .fontWeight(.medium)
                })
                .foregroundColor(Color.ascentDark)
                .frame(width: 40, height: 40)
                .background(Color.ascent.opacity(0.3))
                .cornerRadius(10)
            }
    }
}

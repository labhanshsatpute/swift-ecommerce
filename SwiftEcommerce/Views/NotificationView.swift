import SwiftUI

struct NotificationCard: View {
    
    var title: String
    var description: String
    var time: String
    var isRead: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            if isRead == true {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black.opacity(0.8))
                    .padding(.bottom, 2)
            }
            else {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.ascentDark.opacity(0.8))
                    .padding(.bottom, 2)
            }
            Text(description)
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
                .padding(.bottom, 2)
            Text(time)
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundColor(Color.gray.opacity(0.8))

        }
        .padding(.vertical, 15)
        .padding(.horizontal, 17)
        .background(Color.gray.opacity(0.07))
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .cornerRadius(10)
    }
}

struct NotificationView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Header(title: "Notifications")
                    .padding(.bottom, 15)
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("4 unread notifications")
                            .font(.subheadline)
                            .foregroundColor(Color.ascentDark)
                        Spacer()
                        Text("Mark all as read")
                            .font(.subheadline)
                            .foregroundColor(Color.ascentDark)
                    }.padding(.bottom, 10)
                    ScrollView {
                        
                        NotificationCard(title: "Order Placed", description: "Your order of Rs 357.00 is successfully placed you will recieve a confirmation mail soon", time: "4 minutes ago", isRead: false)
                        NotificationCard(title: "Order Placed", description: "Your order of Rs 357.00 is successfully placed you will recieve a confirmation mail soon", time: "4 minutes ago", isRead: true)
                        NotificationCard(title: "Order Placed", description: "Your order of Rs 357.00 is successfully placed you will recieve a confirmation mail soon", time: "4 minutes ago", isRead: true)
                        NotificationCard(title: "Order Placed", description: "Your order of Rs 357.00 is successfully placed you will recieve a confirmation mail soon", time: "4 minutes ago", isRead: false)

                        NotificationCard(title: "Order Placed", description: "Your order of Rs 357.00 is successfully placed you will recieve a confirmation mail soon", time: "4 minutes ago", isRead: false)
                        NotificationCard(title: "Order Placed", description: "Your order of Rs 357.00 is successfully placed you will recieve a confirmation mail soon", time: "4 minutes ago", isRead: true)
                        NotificationCard(title: "Order Placed", description: "Your order of Rs 357.00 is successfully placed you will recieve a confirmation mail soon", time: "4 minutes ago", isRead: true)
                        NotificationCard(title: "Order Placed", description: "Your order of Rs 357.00 is successfully placed you will recieve a confirmation mail soon", time: "4 minutes ago", isRead: true)

                    }
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Spacer()
            }.padding(15).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    NotificationView()
}

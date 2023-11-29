//
//  Header.swift
//  SwiftEcommerce
//
//  Created by Labhansh Satpute on 28/11/23.
//

import SwiftUI

struct Header: View {
    var title: String
    
    @State private var openNotification: Bool = false
    
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "chevron.left")
                    .fontWeight(.medium)
            })
            .foregroundColor(Color.ascentDark)
            .frame(width: 40, height: 40)
            .background(Color.ascent.opacity(0.3))
            .cornerRadius(10)
            Spacer()
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.ascentDark)
            Spacer()
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
        }.padding(.horizontal, 15)
    }
}

#Preview {
    Header(title: "Notifications")
}

//
//  Header.swift
//  SwiftEcommerce
//
//  Created by Labhansh Satpute on 28/11/23.
//

import SwiftUI

struct Header: View {
    var title: String
    
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
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
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
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

#Preview {
    Header(title: "Notifications")
}

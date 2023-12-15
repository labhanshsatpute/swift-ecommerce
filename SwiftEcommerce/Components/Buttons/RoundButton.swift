//
//  RoundButton.swift
//  SwiftEcommerce
//
//  Created by kundan kapgate on 15/12/23.
//

import SwiftUI

struct RoundButton: View {
    
    @State var title: String = "Title"
    var didTap: (()->())?
    
    var body: some View {
        Button(action: {
            didTap?()
        }, label: {
            Text(title)
                .font(.system(size: 18) .weight(.semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
        })
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(Color.primaryApp)
        .cornerRadius(20)
    }
}

#Preview {
    RoundButton()
}

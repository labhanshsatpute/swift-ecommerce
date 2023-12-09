//
//  PrivacyPolicyView.swift
//  SwiftEcommerce
//
//  Created by kundan kapgate on 08/12/23.
//

import SwiftUI

struct PrivacyPolicyView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            NavigationView {
                
                
                Text("Privacy Policy")
                
            }
            
        }.navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }, label: {
                        Image(systemName: "chevron.left")
                            .fontWeight(.bold)
                            .font(.subheadline)
                    }).foregroundColor(Color.ascentDark)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Text("Privacy Policy")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.ascentDark)
                }
            }
    }
}
#Preview {
    PrivacyPolicyView()
}

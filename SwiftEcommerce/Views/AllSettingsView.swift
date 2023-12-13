//
//  AllSettingsView.swift
//  SwiftEcommerce
//
//  Created by kundan kapgate on 08/12/23.
//

import SwiftUI

struct AllSettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            NavigationView {
                
                
                Text("All Settings")
                
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
                    Text("All Settings")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.ascentDark)
                }
            }
    }
}

#Preview {
    AllSettingsView()
}

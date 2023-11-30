//
//  HeaderTitle.swift
//  SwiftEcommerce
//
//  Created by Labhansh Satpute on 30/11/23.
//

import SwiftUI

struct HeaderTitle: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(Color.ascentDark)
    }
}

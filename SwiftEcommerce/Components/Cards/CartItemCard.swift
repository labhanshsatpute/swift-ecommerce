//
//  CartItemCard.swift
//  SwiftEcommerce
//
//  Created by kundan kapgate on 03/12/23.
//

import SwiftUI

struct CartItemCard: View {
    
    @State var count: Int = 1
    
    func showAlert(title: String, message: String) {
            let alertBox = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertBox.addAction(okAction)
            if let view = UIApplication.shared.keyWindow?.rootViewController {
                view.present(alertBox, animated: true)
            }
        }

    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image("productImage")
                .resizable()
                .aspectRatio(contentMode: .fill).frame(width: 110, height: 110).cornerRadius(10)
            VStack(alignment: .leading, spacing: 7) {
                Text("Heather Men's Regular Fit T-Shirt").font(.system(size: 14)).fontWeight(.semibold).lineSpacing(5)
                Text("Mens Clothing").font(.caption2).foregroundColor(.gray)
                HStack {
                    Text("$499").font(.subheadline).fontWeight(.semibold).lineSpacing(5).foregroundColor(Color.ascentDark)
                    Text("$699").font(.caption).fontWeight(.semibold).lineSpacing(5).strikethrough().foregroundColor(.gray)
                }
                HStack(spacing: 5) {
                    Button(action: { 
                        if self.count == 1 {
                            showAlert(title: "You have to order at least 1 unit", message: "Please enter some keyword to search")
                        }else {
                            self.count -= 1
                        }
                    }, label: {
                        Image(systemName: "minus.circle").fontWeight(.semibold).font(.subheadline)
                    })
                    .padding(6)
                    .background(Color.ascent.opacity(0.2))
                    .cornerRadius(8)
                    Text("\(count)")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 6)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    Button(action: {
                        if self.count == 10 {
                            showAlert(title: "You can order maximum 10 units", message: "Please enter some keyword to search")
                        }else {
                            self.count += 1
                        }                    }, label: {
                        Image(systemName: "plus.circle").fontWeight(.semibold).font(.subheadline)
                    })
                    .padding(6)
                    .background(Color.ascent.opacity(0.2))
                    .cornerRadius(8)
                }
                
            }
        }
    }
}

#Preview {
    CartItemCard()
}

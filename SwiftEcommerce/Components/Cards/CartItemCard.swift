//
//  CartItemCard.swift
//  SwiftEcommerce
//
//  Created by kundan kapgate on 03/12/23.
//

import SwiftUI

struct CartItemCard: View {
    
    @State var count: Int = 1
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading) {
                Image("productImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill).frame(width: 100, height: 100).cornerRadius(10)
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
            
            VStack(alignment: .leading, spacing: 7) {
                Text("Heather Men's Regular Fit T-Shirt").font(.subheadline).fontWeight(.semibold).lineSpacing(5)
                Text("Mens Clothing").font(.caption).foregroundColor(.gray)
                Text("Quantity : 3").font(.caption).foregroundColor(.gray)
                HStack {
                    Text("$499").font(.title3).fontWeight(.semibold).lineSpacing(5).foregroundColor(Color.ascentDark)
                    Text("$699").font(.caption).fontWeight(.semibold).lineSpacing(5).strikethrough().foregroundColor(.gray)
                    Text("10% OFF").font(.caption).fontWeight(.semibold).lineSpacing(5).foregroundColor(.green)
                }
                
                HStack(spacing: 3) {
                    Button(action: {
                        
                    }, label: {
                        Text("Move to wishlist").font(.footnote).fontWeight(.medium)
                    })
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .foregroundColor(Color.ascentDark)
                    .background(Color.ascent.opacity(0.2)).cornerRadius(5)
                    Button(action: {
                        
                    }, label: {
                        Text("Remove").font(.footnote).fontWeight(.medium)
                    })
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .foregroundColor(.red)
                    .background(Color.red.opacity(0.2)).cornerRadius(5)
                    
                }
                
            }
        }
    }
}

#Preview {
    CartItemCard()
}

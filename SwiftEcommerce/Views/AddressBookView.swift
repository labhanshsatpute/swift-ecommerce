//
//  AddressBookView.swift
//  SwiftEcommerce
//
//  Created by kundan kapgate on 08/12/23.
//

import SwiftUI

struct AddressBookView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                
                Button(action: {
                }, label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Add new address")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                        .padding(.horizontal, 20)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.ascentDark)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.ascent.opacity(0.1))
                        .cornerRadius(10)
                    
                })
                
                Text("Your saved addresses")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.gray)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Image(systemName: "house.fill")
                            .font(.subheadline)
                        VStack(alignment: .leading, spacing: 8){
                            HStack{
                                Text("Home").font(.headline).fontWeight(.semibold)
                                Text("Your are here")
                                    .font(.headline)
                                    .foregroundStyle(Color.black.opacity(0.7))
                                    .fontWeight(.medium)
                            }
                            Text("5th Floor, Flat no 505, PR Grand Men's PG Indira Nagar, Gachibowli, Hyderabad, Telangana, India")
                                .font(.footnote).fontWeight(.medium)
                        }
                    }
                    .foregroundStyle(Color.ascentDark)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 17)
                    .background(Color.ascent.opacity(0.1))
                    .cornerRadius(10)

                }
                

                
//                VStack(alignment: .leading, spacing: 7) {
//                    Text("Heather Men's Regular Fit T-Shirt").font(.subheadline).fontWeight(.semibold).lineSpacing(5)
//                    Text("Mens Clothing").font(.caption).foregroundColor(.gray)
//                    Text("Quantity : 3").font(.caption).foregroundColor(.gray)
//                    HStack {
//                        Text("$499").font(.title3).fontWeight(.semibold).lineSpacing(5).foregroundColor(Color.ascentDark)
//                        Text("$699").font(.caption).fontWeight(.semibold).lineSpacing(5).strikethrough().foregroundColor(.gray)
//                        Text("10% OFF").font(.caption).fontWeight(.semibold).lineSpacing(5).foregroundColor(.green)
//                    }
//                
                
            Spacer()
                    
            }.padding(15)
            
            
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
                    Text("Address Book")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.ascentDark)
                }
            }
    }
    
//    @ViewBuilder
//    func PointView(symbool: String, title: String, )
}

#Preview {
    AddressBookView()
}

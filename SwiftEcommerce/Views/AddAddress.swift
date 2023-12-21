//
//  AddAddress.swift
//  SwiftEcommerce
//
//  Created by kundan kapgate on 21/12/23.
//

import SwiftUI

struct AddAddress: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var label: String = ""
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phonePrimary: String = ""
    @State private var phoneAlternate: String = ""
    @State private var street: String = ""
    @State private var city: String = ""
    @State private var postCode: String = ""
    @State private var state = 1
    

    
    var body: some View {
        NavigationStack{
            
            ScrollView{
                VStack{
                   
                    InputBox(text: $label, placeHolder: "Enter Label (eg: Home, Office)", label: "Label")
                            .padding(.bottom, 10)
                           
                    InputBox(text: $name, placeHolder: "Enter Name", label: "Name")
                        .padding(.bottom, 10)
                        
                    InputBox(text: $email, placeHolder: "Email Address", label: "Email Address")
                        .padding(.bottom, 10)
                        
                    InputBox(text: $phonePrimary, placeHolder: "Enter Phone (10 Digits)", label: "Phone (Primary)")
                        .padding(.bottom, 10)
                        
                    InputBox(text: $phoneAlternate, placeHolder: "Phone (Alternate)", label: "Phone (Alternate)")
                        .padding(.bottom, 10)
                    
                    InputBox(text: $street, placeHolder: "Enter Street", label: "Street")
                        .padding(.bottom, 10)
                    
                    InputBox(text: $city, placeHolder: "Enter City", label: "City")
                        .padding(.bottom, 10)
                    
                    InputBox(text: $postCode, placeHolder: "Enter Postal Code (Pincode/Zipcode)", label: "Postal Code")
                        .padding(.bottom, 10)
                    
                    
                        Text("State")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading )
                            .foregroundColor(Color.black.opacity(0.7))
                            .padding(.bottom, 3)
                        Picker("Select State", selection: $state){
                            ForEach(0 ..< 25){
                                Text("\($0) state")
                                
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading )


                    }.padding()
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
                    Text("Add New Address")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.ascentDark)
                }
            }

    }
}

#Preview {
    AddAddress()
}

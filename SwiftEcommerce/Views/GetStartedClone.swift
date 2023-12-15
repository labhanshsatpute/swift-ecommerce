//
//  GetStartedClone.swift
//  SwiftEcommerce
//
//  Created by kundan kapgate on 15/12/23.
//

import SwiftUI

struct GetStartedClone: View {
    var body: some View {
        ZStack{
            
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Spacer()
                Image("app_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                
                Text("Welcome\nto our store")
                    .font(.system(size: 48) .weight(.black))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 12)
                                    
                Text("Ger your groceries in as fast as one hour")
                    .font(.system(size: 16) .weight(.medium))
                    .foregroundColor(Color.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: LoginView()) {
                    HStack {
                        Text("Get Started").font(.title3).fontWeight(.semibold)
                        Image(systemName: "arrow.right").fontWeight(.semibold)
                    }.padding(18).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color.ascent).foregroundColor(.white).cornerRadius(17)
                }
                                
                
                Spacer()
                    .frame(height: 100)
                
            }
            .padding(.horizontal, 20)

        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()

    }
}

#Preview {
    NavigationView{
        GetStartedClone()
    }
}

//
//  GetStartedView.swift
//  SwiftEcommerce
//
//  Created by kundan kapgate on 01/12/23.
//

import SwiftUI

struct GetStartedView: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
  
            OnboardingScreen()
    }
}

#Preview {
    GetStartedView()
}

var totalPages = 3
//OnBoardingScreens
    struct OnboardingScreen: View {
        
        @AppStorage("currentPage") var currentPage = 1
        
        var body: some View {
            ZStack{
                if currentPage == 1{
                    ScreenView(image: "mobile", title: "Order Food", details: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry.")
                }
                
                if currentPage == 2{
                    ScreenView(image: "shopping", title: "Easy Payment", details: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry.")
                }
                
                if currentPage == 3{
                    ScreenView(image: "delivery", title: "Fast Delivery", details: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry.")
                }
              
                }
            }
        }



struct ScreenView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var image: String
    var title: String
    var details: String
    
    var body: some View {
        VStack{
            HStack{
                
                if currentPage == 1{
                    Text ("Hello !")
                        .font(.title)
                        .fontWeight (.semibold)
                        .kerning (1.4)
                }else{
                    Button(action: {
                        currentPage -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .fontWeight(.bold)
                            .font(.subheadline)
                    }).foregroundColor(Color.ascentDark)

                }
                
                
                
                Spacer ()
                
                Button(action: {
                    currentPage == 3
                }, label: {
                    Text ("Skip")
                        .fontWeight (.semibold)
                        .kerning (1.2)
                })
            }.padding()
                .foregroundColor(Color.ascentDark)
            
            
            Spacer (minLength: 0)
            Image (image)
                .resizable()
                .aspectRatio (contentMode: .fit)
                .padding(.horizontal, 16)
                .frame (height:300)
            
            Spacer (minLength: 80)
            
            Text (title)
                .font(.largeTitle)
                .fontWeight (.bold)
                .kerning (1.2)
                .padding (.top)
                .padding(.bottom, 5)
                .foregroundColor(Color.ascentDark)
            
            Text(details)
                .font(.body)
                .fontWeight (.regular)
                .kerning (1.2)
                .padding([.leading,.trailing])
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
            //                    ButtonPrimary(rightIcon: "chevron.right", text: "Next")
            //                        .padding()
            
            Button(action: {
                if currentPage <= totalPages {
                    currentPage += 1
                }else{
                    currentPage = 1
                }
            }, label: {
                
                if currentPage == 3{
                    Text("Get Started")
                        .fontWeight(.semibold)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.ascent)
                        .cornerRadius(40)
                        .padding(.horizontal, 16)
                }else{
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.ascent)
                        .cornerRadius(40)
                        .padding(.horizontal, 16)
                }
                
            })
            
        }
    }
}

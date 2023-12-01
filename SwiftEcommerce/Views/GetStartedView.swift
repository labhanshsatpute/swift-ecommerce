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
            if currentPage == 1 {
                ScreenView(image: "mobile", title: "Order Food", details: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry.")
            }
            
            if currentPage == 2 {
                ScreenView(image: "shopping", title: "Easy Payment", details: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry.")
            }
            
            if currentPage == 3 {
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
        
        NavigationStack {
            VStack(alignment: .center) {
                
                Spacer ()
                
                Image (image)
                    .resizable()
                    .aspectRatio (contentMode: .fit)
                    .frame (height:300)
                
                VStack(alignment: .center) {
                    Text (title)
                        .font(.largeTitle)
                        .fontWeight (.bold)
                        .padding(.bottom, 10)
                        .foregroundColor(Color.ascentDark)
                    Text(details)
                        .font(.subheadline)
                        .lineSpacing(5)
                        .fontWeight (.regular)
                        .kerning(1.05)
                }.multilineTextAlignment(.center).padding(.bottom, 70)
                
                VStack {
                    if currentPage == 1 {
                        ButtonPrimary(handleClick: {
                            currentPage = 2
                        }, rightIcon: "chevron.right", text: "Next")
                    }
                    
                    if currentPage == 2 {
                        ButtonPrimary(handleClick: {
                            currentPage = 3
                        }, rightIcon: "chevron.right", text: "Next")
                    }
                    
                    if currentPage == 3 {
                        ButtonPrimary(handleClick: {
                            
                        }, rightIcon: "chevron.right", text: "Next")
                    }
                }.padding(.bottom, 15)
                                
                VStack(alignment: .trailing) {
                    NavigationLink(destination: ContentView(), label: {
                        Text("Slip to main").fontWeight(.medium)
                        Image(systemName: "arrow.right")
                    }).foregroundColor(.gray)
                }.frame(maxWidth: .infinity).multilineTextAlignment(.trailing)
                
            }.padding(15)

        }
    }
}

//
//  ProductPreview.swift
//  SwiftEcommerce
//
//  Created by Labhansh Satpute on 17/12/23.
//

import SwiftUI

struct ProductPreview: View {
    
    var product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                TabView {
                    ForEach(product.media) { media in
                        VStack {
                            AsyncImage(url: URL(string: media.path)) { image in
                                image.resizable()
                                    .clipped()
                                    .aspectRatio(contentMode: .fill).cornerRadius(10).padding(.bottom, 5).frame(height: 500)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 400).background(Color.gray).cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(product.name).font(.title2).fontWeight(.semibold)
                    Text(product.summary).font(.subheadline).foregroundColor(.gray)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: -2) {
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Image(systemName: "star.fill").foregroundColor(.gray)
                    }.font(.caption).fontWeight(.medium)
                    HStack {
                        Text(currencySymbol + product.price_original)
                            .font(.title).fontWeight(.semibold)
                        Text(currencySymbol + product.price_discounted)
                            .font(.title3).fontWeight(.semibold).strikethrough().foregroundColor(.gray)
                    }
                }
                
                VStack(spacing: 15) {
                    ButtonSecondary(rightIcon: "cart.badge.plus", text: "Add ot Cart")
                    ButtonPrimary(rightIcon: "arrow.forward", text: "Buy Now")
                }
                
                Spacer()
            }.padding(15).padding(.bottom, 0).frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
        }
        
    }
}

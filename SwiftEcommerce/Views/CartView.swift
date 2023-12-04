import SwiftUI

struct CartView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    CartItemCard()
                    CartItemCard()
                }
                
                
            }
            
//            ScrollView{
//                
//                Image(systemName: "cart.badge.plus")
//                    .foregroundColor(Color.gray)
//                    .font(.system(size: 70))
//                    .padding(20)
//                    .background(Color.gray.opacity(0.2))
//                    .cornerRadius(100)
//                    
//
//                Text("Nothing in Your in Cart")
//                    .font(.title)
//                    .fontWeight(.semibold)
//                    
//                
//                Text("That's okay, take your time and browse through our products until you find what you're looking for.")
//                    .padding(.horizontal, 20)
//                    .padding(.vertical, 14)
//                        .foregroundColor(.gray)
//                        .cornerRadius(10)
//                        
//            }
        }.padding(.horizontal, 15).padding(.top, 15)
    }
}

#Preview {
    CartView()
}

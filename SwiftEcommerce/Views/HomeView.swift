import SwiftUI

struct HomeView: View {
    
    @State var searchQuery: String = "";
    
    var body: some View {
        NavigationStack {
            VStack {
                    HStack {
                        HStack(spacing: 12) {
                            Image(systemName: "magnifyingglass").foregroundColor(.gray)
                            TextField("Search Products", text: $searchQuery)
                        }.padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        Button(action: {
                        }, label: {
                            Image(systemName: "magnifyingglass")
                        })
                        .padding(15)
                        .background(Color.ascent)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }.padding(.bottom, 15)

                ScrollView(.vertical, content: {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 13, content: {
                        ProductCard()
                        ProductCard()
                        ProductCard()
                        ProductCard()
                        ProductCard()
                        ProductCard()

                    })
                })
                
            }
        }.padding(15)
    }
}

#Preview {
    HomeView()
}

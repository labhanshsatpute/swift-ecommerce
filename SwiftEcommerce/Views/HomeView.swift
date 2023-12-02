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
                    }.padding(.bottom, 5)
                
                Spacer(minLength: 25)
                
                ScrollView(.vertical, content: {
                    
                    VStack(alignment: .leading) {
                        Text("Explore Categories").font(.headline).fontWeight(.bold).foregroundColor(Color.ascentDark).padding(.bottom, 13)
                        ScrollView(.horizontal, content: {
                            HStack(spacing: 20) {
                                CategoryCard(image: "breakfast", title: "Breakfast")
                                CategoryCard(image: "cleaning", title: "Cleaning Agents")
                                CategoryCard(image: "juice", title: "Juice & Drinks")
                                CategoryCard(image: "pet-food", title: "Pet Foods")
                                CategoryCard(image: "snacks", title: "Snacks")
                                CategoryCard(image: "sweet", title: "Sweet Food")
                                CategoryCard(image: "tea-cofee", title: "Tea & Cofee")
                            }.padding(.bottom, 15)
                        })
                    }

                    Spacer(minLength: 10)
                    
                    VStack(alignment: .leading) {
                        Text("Bestselling Products").font(.headline).fontWeight(.bold).foregroundColor(Color.ascentDark).padding(.bottom, 13)
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 17), GridItem(.flexible(), spacing: 17)], spacing: 17, content: {
                            ProductCard()
                            ProductCard()
                            ProductCard()
                            ProductCard()
                            ProductCard()
                            ProductCard()

                        })

                    }
                })
                
            }
        }.padding(.top,15).padding(.horizontal, 15)
    }
}

#Preview {
    HomeView()
}

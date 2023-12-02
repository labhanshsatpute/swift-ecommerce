import SwiftUI

struct HomeView: View {
    
    @State var categories: [Category] = []
    
    func fetchCategories() {
        if let url = URL(string: "\(apiBaseUrl)/api/category") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let apiResponse = try JSONDecoder().decode(CategoryDataResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.categories = apiResponse.data
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }.resume()
        }
    }
    
    @State var searchQuery: String = "";
    
    
    @State private var selectedCity = 0
    let cities = ["Hyderabad", "Nagpur", "Mumbai"]

    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading) {
                        
                    VStack(alignment: .leading) {
                        HStack(spacing: 0) {
                            Image(systemName: "location")
                                .font(.title3)
                            Picker("Select an option", selection: $selectedCity) {
                                ForEach(0..<cities.count) { index in
                                    Text(cities[index])
                                }
                            }.tint(Color.black).fontWeight(.medium)
                        }.padding(.bottom, 1)
                        Text("Welcome Back!")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    
                    Spacer(minLength: 20)
                    
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
                    }
                    
                    Spacer(minLength: 20)
                    
                    VStack(alignment: .leading) {
                        Text("Explore Categories").font(.headline).fontWeight(.bold).foregroundColor(Color.ascentDark).padding(.bottom, 10)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(categories) { category in
                                    CategoryCard(category: category)
                                }
                            }
                        }
                    }
                    
                    Spacer(minLength: 20)
                    
                    VStack(alignment: .leading) {
                        Text("Bestselling Products").font(.headline).fontWeight(.bold).foregroundColor(Color.ascentDark).padding(.bottom, 10)
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 17), GridItem(.flexible(), spacing: 17)], spacing: 17, content: {
                            ProductCard()
                            ProductCard()
                            ProductCard()
                            ProductCard()
                            ProductCard()
                            ProductCard()
                            
                        })
                        
                    }
                }
                
            }.onAppear() {
                fetchCategories()
            }
        }.padding(.top,15).padding(.horizontal, 15)
    }
}

#Preview {
    HomeView()
}

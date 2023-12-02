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
    
    
    @State private var selectedOption = 0
    let options = ["Hyderabad", "Nagpur", "Mumbai"]

    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                
                VStack(alignment: .leading) {
                        
                    VStack(alignment: .leading) {
                        HStack(spacing: 0) {
                            Image(systemName: "location")
                                .font(.title3)
                            Picker("Select an option", selection: $selectedOption) {
                                ForEach(0..<options.count) { index in
                                    Text(options[index])
                                }
                            }.tint(Color.black).fontWeight(.medium)
                        }.padding(.bottom, 1)
                        Text("Welcome Back!")
                            .font(.title)
                            .fontWeight(.bold)
                    }.padding(.bottom, 12)
                    
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
                    
                    VStack(alignment: .leading) {
                        Spacer(minLength: 15)
                        Text("Explore Categories").font(.headline).fontWeight(.bold).foregroundColor(Color.ascentDark).padding(.bottom, 13)
                        ScrollView(.horizontal, content: {
                            HStack(spacing: 20) {
                                ForEach(categories) { category in
                                    CategoryCard(category: category)
                                }
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

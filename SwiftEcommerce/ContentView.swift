import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: Int = 0
    
    var body: some View {
        NavigationStack {
            Header(title: "Ecommerce")
            Divider()
            TabView(selection: $selectedTab) {
                HomeView().tabItem {
                    Image(systemName: "homekit")
                    Text("Home")
                }.tag(0)
                CartView().tabItem {
                    Image(systemName: "handbag")
                    Text("My Cart")
                }.tag(1)
                OrderView().tabItem {
                    Image(systemName: "shippingbox")
                    Text("My Orders")
                }.tag(2)
                AccountView().tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("My Account")
                }.tag(3)
            }.tint(Color.ascent).frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).padding(0).animation(.easeInOut, value: selectedTab)

        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}

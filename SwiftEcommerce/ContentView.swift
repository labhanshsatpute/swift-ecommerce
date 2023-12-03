import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: String = "My Cart"
    
    var body: some View {
        NavigationStack {
            if selectedTab != "Home" {
                Header(title: selectedTab)
                Divider()
            }
            TabView(selection: $selectedTab) {
                HomeView().tabItem {
                    Image(systemName: "homekit")
                    Text("Home")
                }.tag("Home")
                CartView().tabItem {
                    Image(systemName: "handbag")
                    Text("My Cart")
                }.tag("My Cart").badge(3)
                OrderView().tabItem {
                    Image(systemName: "shippingbox")
                    Text("My Orders")
                }.tag("My Orders")
                AccountView().tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("My Account")
                }.tag("My Account")
            }.tint(Color.ascent).frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).padding(0).toolbarBackground(Color.white, for: .tabBar)

        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "homekit")
                Text("Home")
            }
            CartView().tabItem {
                Image(systemName: "handbag")
                Text("My Cart")
            }
            OrderView().tabItem {
                Image(systemName: "shippingbox")
                Text("My Orders")
            }
            AccountView().tabItem {
                Image(systemName: "person.crop.circle")
                Text("My Profiles")
            }

        }
    }
}

#Preview {
    ContentView()
}

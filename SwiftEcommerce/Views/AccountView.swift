import SwiftUI

struct DashboardTab: View {
    
    var icon: String
    var label: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                Image(systemName: icon)
                    .foregroundColor(Color.ascent)
                    .font(.system(size: 25))
                    .padding(10)
                    .background(Color.ascent.opacity(0.1))
                    .cornerRadius(50)
                VStack(alignment: .leading) {
                    Text(label)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(Color.black.opacity(0.9))
                    Text(description)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.ascent)
                
            }.padding(.top, 10)
        }
    }
}



struct AccountView: View {
        
    @State var user = User(name: "", phone: "", uuid: "", email: "", profile_image: "")
    
    @State var redirectToLogin: Bool = false
    
    func fetchUserDetails() {
        
        let url = URL(string: "\(apiBaseUrl)/api/user")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(UserDefaults.standard.string(forKey: "accessToken")!)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let apiResponse = try JSONDecoder().decode(UserDataResponse.self, from: data)
                    user = apiResponse.data
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }

    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                HStack(alignment: .center, spacing: 10) {
                    AsyncImage(url: URL(string: user.profile_image)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit).cornerRadius(25)
                            .frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                        Text(user.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                }.padding(.bottom, 10)
                Divider()
                
                VStack(alignment: .leading) {
                    
                    NavigationLink(destination: MyOrdersView()) {
                        DashboardTab(icon: "shippingbox", label: "My Orders", description: "Manage your orders")
                    }
                    
                    NavigationLink(destination: AddressBookView()) {
                        DashboardTab(icon: "globe", label: "Address Book", description: "Manage application Address Book")
                    }
                    
                    NavigationLink(destination: FAQsView()) {
                        DashboardTab(icon: "questionmark.circle", label: "FAQs", description: "Manage your orders")
                    }
                    
                    NavigationLink(destination: ChangePasswordView()) {
                        DashboardTab(icon: "person.badge.key", label: "Change Password", description: "Chnage your account password")
                    }
                    
                    NavigationLink(destination: AccountSettingView()) {
                        DashboardTab(icon: "gearshape", label: "Account Settings", description: "Manage your orders")
                    }
                    
                    Button(action: {
                        UserDefaults.standard.removeObject(forKey: "accessToken")
                        redirectToLogin = true
                    }) {
                        DashboardTab(icon: "rectangle.portrait.and.arrow.right", label: "Log out", description: "Manage application languages")
                    }
                    
                    NavigationLink(destination: LoginView(), isActive: $redirectToLogin) {
                        
                    }
                    
                }
            }.padding(.horizontal, 15).padding(.top, 10)
        }.padding(0).onAppear() {
            fetchUserDetails()
        }
        
    }
}

#Preview {
    AccountView()
}

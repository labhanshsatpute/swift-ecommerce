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
    
    var email: String = "kundankapgate2005@gmail.com"
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                HStack(alignment: .center, spacing: 10) {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 50))
                        .foregroundColor(Color.gray)
                    VStack(alignment: .leading) {
                        Text("Kundan Kapgate")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                        Text(email)
                            .font(.subheadline)
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
                    
                    NavigationLink(destination: PrivacyPolicyView()) {
                        DashboardTab(icon: "lock.shield", label: "Privacy Policy", description: "Manage application languages")
                    }
                    
                    NavigationLink(destination: AllSettingsView()) {
                        DashboardTab(icon: "gearshape", label: "All settings", description: "Manage your orders")
                    }
                    
                    NavigationLink(destination: LoginView()) {
                        DashboardTab(icon: "rectangle.portrait.and.arrow.right", label: "Log out", description: "Manage application languages")
                    }
                    
                }
            }.padding(.horizontal, 15).padding(.top, 10)
        }.padding(0)
        
    }
}

#Preview {
    AccountView()
}

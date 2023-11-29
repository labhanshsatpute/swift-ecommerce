import SwiftUI

struct DashboardTab: View {
    
    var icon: String
    var label: String
    var description: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .foregroundColor(.orange)
                .font(.system(size: 25))
                .padding(10)
                .background(Color.ascent.opacity(0.1))
                .cornerRadius(50)
            VStack(alignment: .leading) {
                Text(label)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black.opacity(0.9))
                    .padding(.bottom, 0.5)
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color.ascent)
            
        }.padding(10)
    }
}

struct AccountView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Header(title: "My Account")
                    .padding(.bottom, 20)
                VStack(alignment: .leading) {
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 50))
                            .foregroundColor(Color.gray)
                        VStack(alignment: .leading) {
                            Text("Kundan Kapgate")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.ascentDark)
                            Text("kundankapg2005@gmail.com")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                    }.padding(.bottom, 10)
                    Divider()
                    VStack{
                        
                         
                            DashboardTab(icon: "shippingbox", label: "My Orders", description: "Manage your orders")
                            DashboardTab(icon: "globe", label: "Languages", description: "Manage application languages")
                            
                        
                        
                        

                        
                    }
                }
                Spacer()
            }.padding(15)

        }
    }
}

#Preview {
    AccountView()
}

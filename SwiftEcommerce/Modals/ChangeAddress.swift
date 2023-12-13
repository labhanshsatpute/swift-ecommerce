import SwiftUI

struct ChangeAddress: View {
        
    @State var pincode: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack(alignment: .leading) {
                Text("Change Delivery Address")
                    .font(.title3).fontWeight(.semibold)
                Text("Enter your pincode to check delivery ")
                    .font(.footnote).fontWeight(.regular).foregroundColor(.gray)
            }
            VStack(spacing: 10) {
                Button(action: {
                    
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.footnote)
                            .foregroundColor(Color.ascentDark)
                        Text("Use my current location")
                            .font(.footnote).fontWeight(.medium).foregroundColor(Color.ascentDark)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5).background(Color.ascent.opacity(0.1)).cornerRadius(7)
            }
            VStack(spacing: 10) {
                InputBox(text: $pincode, placeHolder: "Enter Pincode (6 Digits)", label: "Your Pincode")
                ButtonPrimary(text: "Check Delivery")
            }
            VStack {
                
            }
            Spacer()
        }.padding(20).frame(maxWidth: .infinity)
    }
}


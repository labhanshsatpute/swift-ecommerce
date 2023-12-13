import SwiftUI
import MapKit
import Foundation
import CoreLocation

struct ChangeAddress: View {
        
    @State var pincode: String = ""
    @State var mapModalState: Bool = false
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 17.441701, longitude: 78.361002), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    
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
                    mapModalState = true
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
                .sheet(isPresented: $mapModalState, content: {
                    VStack(alignment: .leading, spacing: 15) {
                        VStack(alignment: .leading) {
                            Text("Chhose Location")
                                .font(.title3).fontWeight(.semibold)
                            Text("Select your delivery location on map")
                                .font(.footnote).fontWeight(.regular).foregroundColor(.gray)
                        }
                        Map(coordinateRegion: $region)
                            .frame(maxWidth: .infinity, maxHeight: .infinity).cornerRadius(15)
                            
                    }.padding(20).cornerRadius(15)
                })
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


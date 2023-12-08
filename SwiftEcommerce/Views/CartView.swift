import SwiftUI

struct ChangeAddress: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Change Delivery Address")
        }.presentationDetents([.height(250)]).padding(15)
    }
}

struct CartView: View {
    
    @State var addressModalState: Bool = false
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15) {
                    HStack(alignment: .center, spacing: 10) {
                        HStack {
                            Image(systemName: "location").font(.subheadline)
                            Text("Deliver to Nagpur - 440001").font(.subheadline).fontWeight(.medium)
                        }
                        Spacer()
                        Button(action: {
                            addressModalState = true
                        }, label: {
                            Text("Change Address").font(.footnote).fontWeight(.medium).foregroundColor(Color.ascentDark)
                        })
                        .padding(.horizontal, 7)
                        .padding(.vertical, 5).background(Color.ascent.opacity(0.1)).cornerRadius(5)
                        .sheet(isPresented: $addressModalState, content: {
                            ChangeAddress().multilineTextAlignment(.leading)
                        })
                    }
                    Divider()
                    VStack(alignment: .leading, spacing: 15) {
                        CartItemCard()
                        CartItemCard()
                    }
                    Divider()
                    VStack(alignment: .leading, spacing: 15) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Order Summary")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.ascentDark)
                            Text("View your order summary")
                                .font(.caption2)
                                .foregroundColor(Color.gray)
                        }
                        VStack(alignment: .leading, spacing: 7) {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Heather Men's Regular Fit T-Shirt")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.black)
                                    Text("Quantity = 1 ")
                                        .font(.caption2)
                                        .foregroundColor(Color.gray)
                                }
                                Spacer()
                                Text("$499.00").font(.subheadline).foregroundColor(Color.ascentDark).fontWeight(.semibold)
                            }
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Heather Men's Regular Fit T-Shirt")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.black)
                                    Text("Quantity = 1 ")
                                        .font(.caption2)
                                        .foregroundColor(Color.gray)
                                }
                                Spacer()
                                Text("$499.00").font(.subheadline).foregroundColor(Color.ascentDark).fontWeight(.semibold)
                            }
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Gross Amount")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.black)
                                    Text("")
                                        .font(.caption2)
                                        .foregroundColor(Color.gray)
                                }
                                Spacer()
                                Text("$999.00").font(.subheadline).foregroundColor(Color.ascentDark).fontWeight(.semibold)
                            }
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Coupon Discount")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.black)
                                    Text("Coupon code applied 10% Off")
                                        .font(.caption2)
                                        .foregroundColor(Color.gray)
                                }
                                Spacer()
                                Text("$999.00").font(.subheadline).foregroundColor(Color.ascentDark).fontWeight(.semibold)
                            }
                        }
                    }
                }.padding(.horizontal, 15).padding(.top, 10).padding(.bottom, 20)
            }
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Sub Total")
                        .font(.caption2)
                        .foregroundColor(Color.black)
                    Text("$999.00").font(.title3).foregroundColor(Color.ascentDark).fontWeight(.bold)
                }
                Spacer()
                ButtonPrimary(text: "Place Order")
            }.frame(alignment: .bottom).padding(15).overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color.gray), alignment: .top)


        }
    }
}

#Preview {
    CartView()
}

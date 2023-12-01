import SwiftUI

struct ProductCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("productImage")
                .resizable()
                .aspectRatio(contentMode: .fill).cornerRadius(5).padding(.bottom, 5)
            VStack(alignment: .leading, spacing: 7) {
                Text("Heather Men's Regular Fit T-Shirt").font(.subheadline).fontWeight(.semibold).lineSpacing(5)
                Text("Mens Clothing").font(.caption2).foregroundColor(.gray)
                HStack {
                    Text("$499.00").font(.subheadline).fontWeight(.semibold).lineSpacing(5).foregroundColor(Color.ascentDark)
                    Text("$699.00").font(.subheadline).fontWeight(.semibold).lineSpacing(5).strikethrough()

                }
            }
        }
    }
}

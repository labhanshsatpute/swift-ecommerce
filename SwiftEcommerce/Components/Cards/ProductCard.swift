import SwiftUI

struct ProductCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("productImage")
                .resizable()
                .aspectRatio(contentMode: .fill).cornerRadius(10).padding(.bottom, 5)
            VStack(alignment: .leading, spacing: 7) {
                HStack {
                    Text("Mens Clothing").font(.caption2).foregroundColor(.gray)
                    Spacer()
                    HStack(spacing: 2) {
                        Text("4.2")
                        Image(systemName: "star.fill").font(.caption2)
                    }.foregroundColor(.yellow).font(.caption2 ).fontWeight(.medium)
                }
                Text("Heather Men's Regular Fit T-Shirt").font(.system(size: 14)).fontWeight(.semibold).lineSpacing(5)

                HStack {
                    Text("$499").font(.subheadline).fontWeight(.semibold).lineSpacing(5).foregroundColor(Color.ascentDark)
                    Text("$699").font(.caption).fontWeight(.semibold).lineSpacing(5).strikethrough().foregroundColor(.gray)
                }

            }
        }
    }
}

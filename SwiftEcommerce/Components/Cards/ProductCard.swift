import SwiftUI

struct ProductCard: View {
    
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.thumbnail_image)) { image in
                image.resizable()
                        .aspectRatio(contentMode: .fit).cornerRadius(10).padding(.bottom, 5)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading, spacing: 7) {
                HStack {
                    Text(product.parent_category.name).font(.caption2).foregroundColor(.gray)
                    Spacer()
                    HStack(spacing: 2) {
                        Text("4.2")
                        Image(systemName: "star.fill").font(.caption2)
                    }.foregroundColor(.yellow).font(.caption2 ).fontWeight(.medium)
                }
                Text(product.name).font(.system(size: 14)).fontWeight(.semibold).lineSpacing(5)

                HStack {
                    Text(product.price_discounted).font(.subheadline).fontWeight(.semibold).lineSpacing(5).foregroundColor(Color.ascentDark)
                    Text(product.price_original).font(.caption).fontWeight(.semibold).lineSpacing(5).strikethrough().foregroundColor(.gray)
                }

            }
        }
    }
}

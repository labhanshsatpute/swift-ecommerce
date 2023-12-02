import SwiftUI

struct CategoryCard: View {
    
    var category: Category
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: "\(storageBaseUrl)/\(category.thumbnail_image)")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit).cornerRadius(8).padding(.bottom, 5)
                    .frame(width: 90, height: 90)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .center) {
                Text(category.name).font(.caption2).fontWeight(.medium)
            }

        }
    }
}

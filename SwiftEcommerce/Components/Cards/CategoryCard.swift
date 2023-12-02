import SwiftUI

struct CategoryCard: View {
    
    var image: String
    var title: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit).cornerRadius(5).padding(.bottom, 5)
                .frame(width: 90, height: 90)
            VStack(alignment: .center) {
                Text(title).font(.caption2).fontWeight(.medium)
            }
        }
    }
}

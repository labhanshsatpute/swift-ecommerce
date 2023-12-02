struct CategoryDataResponse: Decodable {
    let status: Bool
    let message: String
    let data: [Category]
}

struct Category: Decodable, Identifiable {
    let id: Int
    let name: String
    let thumbnail_image: String
}

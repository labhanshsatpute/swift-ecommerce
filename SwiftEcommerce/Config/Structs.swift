struct CategoryDataResponse: Decodable {
    let status: Bool
    let message: String
    let data: [Category]
}

struct ProductDataResponse: Decodable {
    let status: Bool
    let message: String
    let data: [Product]
}



struct Category: Decodable, Identifiable {
    let id: Int
    let name: String
    let thumbnail_image: String
}

struct ParentCategory: Decodable, Identifiable {
    let id: Int
    let name: String
}

struct ProductMedia: Decodable, Identifiable {
    let id: Int
    let type: String
    let path: String
}

struct Product: Decodable, Identifiable {
    let id: Int
    let name: String    
    let summary: String
    let thumbnail_image: String
    let parent_category: ParentCategory
    let price_original: String
    let price_discounted: String
    let media: [ProductMedia]
}


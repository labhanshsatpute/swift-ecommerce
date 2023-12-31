struct CategoryDataResponse: Decodable {
    let status: Bool
    let message: String
    let data: [Category]
}

struct AuthDataResponse: Decodable {
    let status: Bool
    let message: String
    let data: Auth?
}

struct Auth: Decodable {
    let token: String
    let user: User
}

struct User: Decodable, Encodable {
    let name: String
    let phone: String
    let uuid: String?
    let email: String
    let profile_image: String
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


struct UserDataResponse: Decodable {
    let status: Bool
    let message: String
    let data: User
}

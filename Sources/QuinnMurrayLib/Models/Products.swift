//
//  File.swift
//  
//
//  Created by Jon Sweeney on 5/31/22.
//

import Foundation

//public struct ProductsResponse: Codable {
//    let products: [Product]
//}
//
//public struct Product: Codable {
////    let id: String
//    let price: Double
////    let inStock, lowStock, inStorePickup: Bool
////    let title, welcomeDescription, imgURL: String
////    let category: Category
////    let unit: Unit
////    let discount: Int
////    let rating: Int?
////    let imgGroup: [String]
//    
//    enum CodingKeys: String, CodingKey {
//        case price
////        case id, price, inStock, lowStock, inStorePickup//, title
////        case welcomeDescription = "description"
////        case imgURL = "imgUrl"
////        case category, unit, discount, rating, imgGroup
//    }
//}
public struct ProductElement: Codable {
    let id: ID2
    let price: Double
    let inStock, lowStock, inStorePickup: Bool
    let title, productDescription, imgURL: String
    let category: Category2
    let unit: Unit2
    let discount: Int
    let rating: Int?
    let imgGroup: [String]

    enum CodingKeys: String, CodingKey {
        case id, price, inStock, lowStock, inStorePickup, title
        case productDescription = "description"
        case imgURL = "imgUrl"
        case category, unit, discount, rating, imgGroup
    }
}

enum Category2: String, Codable {
    case automotive = "automotive"
    case bikes = "bikes"
    case electronics = "electronics"
    case fashion = "fashion"
    case furniture = "furniture"
    case giftshop = "giftshop"
    case groceries = "groceries"
    case grocery1 = "grocery1"
    case healthBeauty = "health&beauty"
    case healthbeauty = "healthbeauty"
    case homeGarden = "home&garden"
    case music = "music"
}

enum ID2: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ID2.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ID"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum Unit2: String, Codable {
    case kg = "kg"
}

typealias Product = [ProductElement]

//
//  File.swift
//  
//
//  Created by Jon Sweeney on 5/31/22.
//

import Foundation

typealias Product = [ProductElement]

public struct ProductElement: Codable {
    public let id: ID
    public let price: Double
    public let inStock, lowStock, inStorePickup: Bool
    public let title, productDescription, imgURL: String
    public let category: Category
    public let unit: Unit
    public let discount: Int
    public let rating: Int?
    public let imgGroup: [String]

    enum CodingKeys: String, CodingKey {
        case id, price, inStock, lowStock, inStorePickup, title
        case productDescription = "description"
        case imgURL = "imgUrl"
        case category, unit, discount, rating, imgGroup
    }
}

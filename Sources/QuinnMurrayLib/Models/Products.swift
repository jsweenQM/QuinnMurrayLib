//
//  File.swift
//  
//
//  Created by Jon Sweeney on 5/31/22.
//

import Foundation

typealias Product = [ProductElement]

public struct ProductElement: Codable {
    let id: ID
    let price: Double
    let inStock, lowStock, inStorePickup: Bool
    let title, productDescription, imgURL: String
    let category: Category
    let unit: Unit
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

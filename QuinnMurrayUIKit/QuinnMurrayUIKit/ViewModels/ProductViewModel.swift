//
//  ProductViewModel.swift
//  QuinnMurrayUIKit
//
//  Created by Jon Sweeney on 6/6/22.
//

import Foundation
import QuinnMurrayLib

struct ProductListViewModel {
    let products: [ProductElement]
}

extension ProductListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.products.count
    }
    
    func productAtIndex(_ index: Int) -> ProductViewModel {
        let product = self.products[index]
        return ProductViewModel(product)
    }
}

struct ProductViewModel {
    private let product: ProductElement
}

extension ProductViewModel {
    init(_ product: ProductElement) {
        self.product = product
    }
}

extension ProductViewModel {
    var id: ID {
        product.id
    }
    
    var price: String {
        let price = product.price
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        return currencyFormatter.string(from: NSNumber(value: price)) ?? ""
    }
    
    var inStock: Bool {
        product.inStock
    }
    
    var lowStock: Bool {
        product.lowStock
    }
    
    var inStorePickup: Bool {
        product.inStorePickup
    }
    
    var title: String {
        product.title
    }
    
    var description: String {
        product.productDescription
    }
    
    var category: QMCategory {
        // TODO: Switch return Display name
        product.category
    }
    
    var unit: QMUnit {
        // TODO: Switch return Display name
        product.unit
    }
    
    var discount: Int {
        product.discount
    }
    
    var rating: Int? {
        product.rating
    }
    
    var imgGroup: [String] {
        product.imgGroup
    }
}

//
//  SoreFrontViewModel.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020.
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

struct StoreFrontViewModel: Codable {
    var name : String
    var price : String
    var quantity : Int
    
    init(name: String, price: String, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}

//
//  XMLServiceAdapter.swift
//  ShopApp
//
//  Created by Пк on 03.08.2020.
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class XMLServiceAdapter {
    private var service : XMLService
    
    
    init(adaptee: XMLService) {
        service = adaptee
    }
    
    func obtainInformation() {
        service.obtain()
    }
    
    func save() {
        service.save()
    }
}

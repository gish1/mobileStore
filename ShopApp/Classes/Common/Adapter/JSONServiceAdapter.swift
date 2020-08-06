//
//  JSONService.swift
//  ShopApp
//
//  Created by Пк on 03.08.2020.
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation


class JSONServiceAdapter: DataService {
    var service: JSONService
    
    init(adaptee: JSONService) {
        service = adaptee
    }
    
    func obtainInformation(fileName: String) -> Any? {
        return try? service.loadJSON(withFilename: fileName)
    }
    
    func save(data: Any, fileName: String) -> Bool {
        return try! service.save(jsonObject: data as! [StoreFrontViewModel], toFilename: fileName)
    }
}

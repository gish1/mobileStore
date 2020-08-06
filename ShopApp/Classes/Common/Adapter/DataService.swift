//
//  DataService.swift
//  ShopApp
//
//  Created by Пк on 02.08.2020.
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

public protocol DataService {
    func obtainInformation(fileName: String) -> Any?
    func save(data: Any, fileName: String) -> Bool
}
 

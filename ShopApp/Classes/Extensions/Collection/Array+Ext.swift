//
//  Array+Ext.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

extension Array {
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    @discardableResult
    mutating func replaceElement(_ oldElement: Element, withElement element: Element) -> Bool {
        if let i = firstIndex(where: { String(describing: $0) == String(describing: oldElement) }) {
            self[i] = element
            return true
        }
        return false
    }
    
    mutating func removeObject<U: Equatable>(_ object: U) {
        var index: Int?
        
        for (idx, objectToCompare) in self.enumerated() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if let index = index {
            self.remove(at: index)
        }
    }
    
    mutating func removeElement<U: AnyObject>(_ element: U) {
        var index: Int?
        
        for (idx, objectToCompare) in self.enumerated() {
            if let to = objectToCompare as? U {
                if element === to {
                    index = idx
                }
            }
        }
        
        if let index = index {
            self.remove(at: index)
        }
    }
}

extension Array {
    subscript (safe index: Index) -> Element? {
        return 0 <= index && index < count ? self[index] : nil
    }
}

extension Array {
    func crossJoin<A, B, C>(array: [B], joiner: @escaping (A, B) -> C?) -> [C] {
        var results = [C]()
        for (i, a) in self.enumerated() {
            if let b = array[safe: i] {
                if let result = joiner(a as! A, b) {
                    results.append(result)
                }
            }
        }
        return results
    }
}


//
//  JsonService.swift
//  ShopApp
//
//  Created by Пк on 03.08.2020.
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation


class JSONService {
    
    func loadJSON(withFilename filename: String) throws -> Any? {
        let fm =  FileManager.default
        let urls =  fm.urls(for: .documentDirectory, in: .userDomainMask)
        
        if let url =  urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = fileURL.appendingPathExtension("json")
            let data = try Data(contentsOf: fileURL)
            do {
                let info = try JSONDecoder().decode([StoreFrontViewModel].self, from: data)
                return info
                
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
            }
        }
        return []
    }
    
    func save(jsonObject: [StoreFrontViewModel], toFilename filename: String) throws -> Bool {
        let fm =  FileManager.default
        let urls =  fm.urls(for: .documentDirectory, in: .userDomainMask)
        if let url =  urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = fileURL.appendingPathExtension("json")
            let encodedData = try? JSONEncoder().encode(jsonObject)
            try encodedData!.write( to: fileURL, options: [.atomicWrite])
            return true
        }
        return false
    }
}

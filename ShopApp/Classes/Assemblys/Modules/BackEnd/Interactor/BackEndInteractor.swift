//
//  BackEndInteractor.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class BackEndInteractor: BackEndInteractorInput {
    private func adapterInit() -> JSONServiceAdapter{
        let jsonService = JSONService()
        return JSONServiceAdapter(adaptee: jsonService)
    }
    
    func obtainInformation() -> Any? {
        let adapter = adapterInit()
        return adapter.obtainInformation(fileName: "json")
    }
    
    func saveInformation(data: Any) -> Bool {
        let adapter = adapterInit()
        return adapter.save(data: data, fileName: "json")
    }
}

// MARK: Private
extension BackEndInteractor {
    
}

//
//  SecondBackEndInteractor.swift
//  ShopApp
//
//  Created by Пк on 30.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class SecondBackEndInteractor: SecondBackEndInteractorInput {
    private func adapterInit() -> JSONServiceAdapter{
        let jsonService = JSONService()
        return JSONServiceAdapter(adaptee: jsonService)
    }
    
    func saveInformation(data: Any) -> Bool {
        let adapter = adapterInit()
        return adapter.save(data: data, fileName: "json")
    }
}

// MARK: Private
extension SecondBackEndInteractor {
    
}

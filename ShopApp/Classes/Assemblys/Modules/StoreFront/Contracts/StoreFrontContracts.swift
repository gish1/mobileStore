//
//  StoreFrontContracts.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

// Module Input
protocol StoreFrontModuleInput: class {
    
}

// Module Output
protocol StoreFrontModuleOutput {
    
}

// View Input
protocol StoreFrontViewInput: class {
    func set(title: String)
    func set(models: Any?)

}

// View Output
protocol StoreFrontViewOutput: class {
    func viewDidLoad()
    func viewLoadInformation()
    func save(data: Any) -> Bool
    func showAlert(title:String,message: String)
}

// Interactor
protocol StoreFrontInteractorInput {
    func obtainInformation() -> Any?
    func saveInformation(data: Any) -> Bool
}

// Router
protocol StoreFrontRouterProtocol: AlertRoutable {
    
}

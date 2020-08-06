//
//  BackEndContracts.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

// Module Input
protocol BackEndModuleInput: class {
}

// Module Output
protocol BackEndModuleOutput {
    
}

// View Input
protocol BackEndViewInput: class {
    func set(title: String)
    func set(models: Any?)    
}

// View Output
protocol BackEndViewOutput: class {
    func viewDidLoad()
    func viewLoadInformation()
    func informationDidTap(models: [StoreFrontViewModel], index: Int)
    func informationDidTap(models: [StoreFrontViewModel])
    func save(data: Any) -> Bool
}

// Interactor
protocol BackEndInteractorInput {
    func saveInformation(data: Any) -> Bool
    func obtainInformation() -> Any?
}

// Router
protocol BackEndRouterProtocol: AlertRoutable {
    func showInformation(models: [StoreFrontViewModel], index: Int)
    func showInformation(models: [StoreFrontViewModel])
}

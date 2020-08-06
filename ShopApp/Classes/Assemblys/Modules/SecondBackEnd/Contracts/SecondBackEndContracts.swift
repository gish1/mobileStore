//
//  SecondBackEndContracts.swift
//  ShopApp
//
//  Created by Пк on 30.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

// Module Input
protocol SecondBackEndModuleInput {
    func setModelsIndex(models: [StoreFrontViewModel], index: Int)
    func setModels(models:[StoreFrontViewModel])
}

// Module Output
protocol SecondBackEndModuleOutput {
    
}

// View Input
protocol SecondBackEndViewInput: class {
    func set(title: String)
    func set(models: [StoreFrontViewModel], index:Int)
    func set(models: [StoreFrontViewModel])
}

// View Output
protocol SecondBackEndViewOutput: class {
    func viewDidLoad()
    func cancelDidTap()
    func showAlert(title: String, message: String)
    func save(data: Any) -> Bool
}

// Interactor
protocol SecondBackEndInteractorInput {
    func saveInformation(data: Any) -> Bool
}

// Router
protocol SecondBackEndRouterProtocol: AlertRoutable {
    func dismiss()
}

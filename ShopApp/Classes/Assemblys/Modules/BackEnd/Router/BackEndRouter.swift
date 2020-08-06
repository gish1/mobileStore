//
//  BackEndRouter.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class BackEndRouter: BaseModuleRouter, BackEndRouterProtocol {
    func showInformation(models: [StoreFrontViewModel], index : Int) {
        let module = container.resolve(SecondBackEndAssembly.self).build(coordinator: coordinator)
        coordinator.router.push(module)
        module.input.setModelsIndex(models: models, index: index)
    }
    
    func showInformation(models: [StoreFrontViewModel]) {
        let module = container.resolve(SecondBackEndAssembly.self).build(coordinator: coordinator)
        coordinator.router.push(module)
        module.input.setModels(models: models)
    }
}

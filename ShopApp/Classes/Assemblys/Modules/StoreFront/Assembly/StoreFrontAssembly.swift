//
//  StoreFrontAssembly.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

typealias StoreFrontModule = Module<StoreFrontModuleInput, StoreFrontModuleOutput>

class StoreFrontAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> StoreFrontModule {
        // View
        let view = StoreFrontViewController.controllerFromStoryboard("StoreFront")
        
        // Interactor
        let interactor = StoreFrontInteractor()
        
        // Router
        let router = StoreFrontRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = StoreFrontPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}

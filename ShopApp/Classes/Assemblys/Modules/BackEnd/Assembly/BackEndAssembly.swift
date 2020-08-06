//
//  BackEndAssembly.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

typealias BackEndModule = Module<BackEndModuleInput, BackEndModuleOutput>

class BackEndAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> BackEndModule {
        // View
        let view = BackEndViewController.controllerFromStoryboard("BackEnd")
        
        // Interactor
        let interactor = BackEndInteractor()
        
        // Router
        let router = BackEndRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = BackEndPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}

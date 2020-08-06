//
//  SecondBackEndAssembly.swift
//  ShopApp
//
//  Created by Пк on 30.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

typealias SecondBackEndModule = Module<SecondBackEndModuleInput, SecondBackEndModuleOutput>

class SecondBackEndAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> SecondBackEndModule {
        // View
        let view = SecondBackEndViewController.controllerFromStoryboard("SecondBackEnd")
        
        // Interactor
        let interactor = SecondBackEndInteractor()
        
        // Router
        let router = SecondBackEndRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = SecondBackEndPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}

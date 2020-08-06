//
//  StoreFrontPresenter.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class StoreFrontPresenter: BasePresenter<StoreFrontInteractorInput, StoreFrontRouterProtocol>, StoreFrontModuleOutput {
    
    // MARK: - Weak properties
    weak var view: StoreFrontViewInput?
}

// MARK: Private
extension StoreFrontPresenter {
    
}

// MARK: Module Input
extension StoreFrontPresenter: StoreFrontModuleInput {
    
}

// MARK: View Output
extension StoreFrontPresenter: StoreFrontViewOutput {
    func save(data: Any) -> Bool {
        return interactor.saveInformation(data: data)
    }
    
    func viewLoadInformation() {
        let viewModels = interactor.obtainInformation()
        view?.set(models: viewModels)
    }
    
    func showAlert(title:String,message: String) {
        router.showAlert(title: title, message: message)
    }
    
    func viewDidLoad() {
        view?.set(title: "StoreFront")
    }
}

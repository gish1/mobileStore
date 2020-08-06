//
//  SecondBackEndPresenter.swift
//  ShopApp
//
//  Created by Пк on 30.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class SecondBackEndPresenter: BasePresenter<SecondBackEndInteractorInput, SecondBackEndRouterProtocol>, SecondBackEndModuleOutput {
    
    // MARK: - Weak properties
    weak var view: SecondBackEndViewInput?
}

// MARK: Private
extension SecondBackEndPresenter {
    
}

// MARK: Module Input
extension SecondBackEndPresenter: SecondBackEndModuleInput {
    func setModels(models: [StoreFrontViewModel]) {
        view?.set(models: models)
    }
    
    func setModelsIndex(models: [StoreFrontViewModel], index : Int) {
        view?.set(models: models, index: index)
    }
}

// MARK: View Output
extension SecondBackEndPresenter: SecondBackEndViewOutput {

    func showAlert(title: String, message: String) {
        router.showAlert(title: title, message: message)
    }
    
    func save(data: Any) -> Bool {
        return interactor.saveInformation(data: data)
    }
    
    func cancelDidTap() {
        router.dismiss()
    }
    
    
    func viewDidLoad() {
        //view?.set(title: "SecondBackEnd")
    }
}

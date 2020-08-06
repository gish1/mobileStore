//
//  BackEndPresenter.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class BackEndPresenter: BasePresenter<BackEndInteractorInput, BackEndRouterProtocol>, BackEndModuleOutput {
    
    // MARK: - Weak properties
    weak var view: BackEndViewInput?
}

// MARK: Private
extension BackEndPresenter {
    
}

// MARK: Module Input
extension BackEndPresenter: BackEndModuleInput {
}

// MARK: View Output
extension BackEndPresenter: BackEndViewOutput {
    
    func informationDidTap(models: [StoreFrontViewModel], index: Int) {
        router.showInformation(models: models, index: index)
    }
    
    func informationDidTap(models: [StoreFrontViewModel]) {
        router.showInformation(models: models)
    }
    
    func save(data: Any) -> Bool {
        return interactor.saveInformation(data: data)
    }
    
    func viewLoadInformation() {
        let viewModels = interactor.obtainInformation()
        view?.set(models: viewModels)
    }
    
    func viewDidLoad() {
        view?.set(title: "BackEnd")
    }
}

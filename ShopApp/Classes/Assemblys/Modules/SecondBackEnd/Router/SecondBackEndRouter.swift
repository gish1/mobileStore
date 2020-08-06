//
//  SecondBackEndRouter.swift
//  ShopApp
//
//  Created by Пк on 30.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class SecondBackEndRouter: BaseModuleRouter, SecondBackEndRouterProtocol {
    func dismiss() {
        coordinator.router.popModule()
    }
}

//
//  MainCoordinatorAssembly.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class MainCoordinatorAssembly: Assembly {
    func build(router: RouterType) -> MainCoordinatorType {
        let coordinator = MainCoordinator(container: container, router: router)
        return coordinator
    }
}

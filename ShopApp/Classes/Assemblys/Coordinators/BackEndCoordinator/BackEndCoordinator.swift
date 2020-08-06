//
//  BackEndCoordinator.swift
//  ShopApp
//
//  Created by Пк on 29.07.2020
//	Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class BackEndCoordinator: BaseCoordinator, BackEndCoordinatorType {
    override func start() {
        let module = container.resolve(BackEndAssembly.self).build(coordinator: self)
        router.setRootModule(module)
    }
}

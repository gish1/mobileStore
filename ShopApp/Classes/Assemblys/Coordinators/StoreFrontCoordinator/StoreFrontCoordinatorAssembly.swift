//
//  StoreFrontCoordinatorAssembly.swift
//  ShopApp
//
//  Created by Пк on 29.07.2020
//	Copyright © 2020 Пк. All rights reserved.
//

import UIKit

class StoreFrontCoordinatorAssembly: Assembly {
    func build() -> StoreFrontCoordinatorType {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let router = Router(navigationController: navigationController)
        let coordinator = StoreFrontCoordinator(container: container, router: router)
        return coordinator
    }
}

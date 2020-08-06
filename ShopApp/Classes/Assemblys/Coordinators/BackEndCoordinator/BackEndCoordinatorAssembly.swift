//
//  BackEndCoordinatorAssembly.swift
//  ShopApp
//
//  Created by Пк on 29.07.2020
//	Copyright © 2020 Пк. All rights reserved.
//

import UIKit

class BackEndCoordinatorAssembly: Assembly {
    func build() -> BackEndCoordinatorType {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let router = Router(navigationController: navigationController)
        let coordinator = BackEndCoordinator(container: container, router: router)
        return coordinator
    }
}

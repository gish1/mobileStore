//
//  TabBarCoordinator.swift
//  Exemple
//
//  Created by Bart on 26.10.2019
//	Copyright © 2019 iDevs.io. All rights reserved.
//

import UIKit

class TabBarCoordinator: BaseCoordinator, TabBarCoordinatorType {
    var tabBarPresenter: TabBarPresenter!
    
    override func start() {
        tabBarPresenter = TabBarPresenter(items: [
            TabBarItem(title: "Store-Front", viewController: storeFrontViewController(), image: #imageLiteral(resourceName: "Home")),
            TabBarItem(title: "Back-End", viewController: backEndViewController(), image: #imageLiteral(resourceName: "Info"))
        ])
    }
    
    override func toPresent() -> UIViewController {
        return tabBarPresenter.toPresent()
    }
}

extension TabBarCoordinator {
    func storeFrontViewController() -> UIViewController {
        let coordinator = container.resolve(StoreFrontCoordinatorAssembly.self).build()
        self.addChild(coordinator)
        coordinator.start()
        return coordinator.toPresent()
    }
    
    func backEndViewController() -> UIViewController {
        let coordinator = container.resolve(BackEndCoordinatorAssembly.self).build()
        self.addChild(coordinator)
        coordinator.start()
        return coordinator.toPresent()
    }
}

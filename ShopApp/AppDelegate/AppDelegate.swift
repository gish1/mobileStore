//
//  AppDelegate.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: AppDelegateManager {
    var window: UIWindow?
    
    lazy var container: DependencyContainer = {
        let factory = AssemblyFactory()
        let container = DependencyContainer(assemblyFactory: factory)
        
        // Setup Coordinators
        container.apply(AppCoordinatorAssembly.self)
        container.apply(MainCoordinatorAssembly.self)
        container.apply(TabBarCoordinatorAssembly.self)
        container.apply(StoreFrontCoordinatorAssembly.self)
        container.apply(BackEndCoordinatorAssembly.self)
        
        // Setup Modules
        container.apply(StoreFrontAssembly.self)
        container.apply(BackEndAssembly.self)
        container.apply(SecondBackEndAssembly.self)
        
        // Setup Services
        container.apply(AppConfigServiceAssembly.self)
        container.apply(EnvironmentServiceAssembly.self)
        
        
        return container
    }()
    
    override var services: [AppDelegateService] {
        return [
            ApplicationService(container: container, window: window)
        ]
    }
}


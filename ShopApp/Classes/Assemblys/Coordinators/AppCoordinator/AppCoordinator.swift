//
//  AppCoordinator.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class AppCoordinator: BaseCoordinator, AppCoordinatorType {
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure(tutorialWasShown: true, isAutorized: true)
    }
    
    override func start(with option: DeepLinkOption?) {
        if let option = option {
            switch option {
            case .home:
                startMainFlow()
            }
        } else {
            switch instructor {
            case .auth: startAuthFlow()
            case .onboarding: startOnboardingFlow()
            case .main: startMainFlow()
            }
        }
    }
}

// MARK: Main Flow
extension AppCoordinator {
    func startMainFlow() {
        let coordinator = container.resolve(TabBarCoordinatorAssembly.self).build()
        addChild(coordinator)
        coordinator.start()
        self.router.setRootModule(coordinator, hideBar: true)
    }
}

// MARK: Auth Flow
extension AppCoordinator {
    func startAuthFlow() {
        
    }
}

// MARK: Onboarding Flow
extension AppCoordinator {
    func startOnboardingFlow() {
        
    }
}

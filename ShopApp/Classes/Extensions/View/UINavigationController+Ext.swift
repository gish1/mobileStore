//
//  UINavigationController+Ext.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

public extension UINavigationController {
    var rootViewController: UIViewController {
        return self.viewControllers.first!
    }
    
    func setTransparentNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
}

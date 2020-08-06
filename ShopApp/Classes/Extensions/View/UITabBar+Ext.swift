//
//  UITabBar+Ext.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

extension UITabBar {
    func setBackgroundImage(_ image: UIImage, yOffset: Int) {
        self.backgroundImage = UIImage()
        self.shadowImage = UIImage()
        let tabBarView = UIImageView(image: image)
        tabBarView.frame = CGRect(x: 0, y: yOffset, width: Int(tabBarView.bounds.width), height: Int(tabBarView.bounds.height))
        self.addSubview(tabBarView)
        self.sendSubviewToBack(tabBarView)
    }
}

//
//  UIViewController + Extention.swift
//  MySchedule
//
//  Created by Александр Прайд on 26.05.2023.
//

import UIKit

extension UIViewController {
    
    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = .systemGray6
        // navBarAppearance.backgroundColor = .systemTeal
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuaration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuaration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
        tabBarController?.tabBar.barTintColor = .systemGray6

    }
}

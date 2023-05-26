//
//  MainTabBarController.swift
//  MySchedule
//
//  Created by Александр Прайд on 25.05.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
    
    private func setupViews() {
        let scheduleVC = ScheduleViewController()
        let tasksVC = TasksViewController()
        let contactsVC = ContactsViewController()
        
        scheduleVC.setTabBarImage(imageName: "calendar.badge.clock", title: "Календарь")
        tasksVC.setTabBarImage(imageName: "text.badge.checkmark", title: "Задачи")
        contactsVC.setTabBarImage(imageName: "rectangle.stack.badge.person.crop", title: "Контакты")
        
        let scheduleNC = UINavigationController(rootViewController: scheduleVC)
        let tasksNC = UINavigationController(rootViewController: tasksVC)
        let contactsNC = UINavigationController(rootViewController: contactsVC)
        
        //scheduleNC.navigationBar.barTintColor = .systemGray6
        //hideNavigationBarLine(scheduleNC.navigationBar)
        
        let tabBarList = [scheduleNC, tasksNC, contactsNC]
        
        viewControllers = tabBarList
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    
    private func setupTabBar() {
        tabBar.tintColor = .link
        tabBar.isTranslucent = false
    }
}


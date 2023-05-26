//
//  ContactsViewController.swift
//  MySchedule
//
//  Created by Александр Прайд on 25.05.2023.
//

import UIKit

class ContactsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        
        view.backgroundColor = .yellow
        title = "Контакты"
    }
}

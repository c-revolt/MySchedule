//
//  UILabel + Extention.swift
//  MySchedule
//
//  Created by Александр Прайд on 28.05.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont?, alignment: NSTextAlignment) {
        self.init()
        self.text = text
        self.font = font
        self.textAlignment = alignment
        self.textColor = .black
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 2
    }
    
    
    
}

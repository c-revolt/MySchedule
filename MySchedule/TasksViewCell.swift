//
//  TasksViewCell.swift
//  MySchedule
//
//  Created by Александр Прайд on 28.05.2023.
//

import UIKit

class TasksViewCell: UITableViewCell {
    
    static let identifire = "TasksViewCell"
    
    private let taskTitleLabel: UILabel = UILabel(text: "Психология", font: .avenirBold18(), alignment: .left)
    private let taskDescriptionLabel: UILabel = UILabel(text: "Архетипы. Прочитать, сделать конспект, ответить на вопросы, поразмышлять.", font: .avenirNext14(), alignment: .left)
    private let readyButton: UIButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        view()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func view() {
        readyButton.translatesAutoresizingMaskIntoConstraints = false
        readyButton.setBackgroundImage(UIImage(systemName: "chevron.down.circle"), for: .normal)
        readyButton.tintColor = .black
        readyButton.addTarget(self, action: #selector(readyButtonTapped), for: .touchUpInside)
    }

    private func layout() {
        contentView.addSubview(readyButton)
        addSubview(taskTitleLabel)
        addSubview(taskDescriptionLabel)
        
        NSLayoutConstraint.activate([
            readyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            readyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            readyButton.heightAnchor.constraint(equalToConstant: 40),
            readyButton.widthAnchor.constraint(equalToConstant: 40),
            taskTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            taskTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            taskTitleLabel.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant: -5),
            taskTitleLabel.heightAnchor.constraint(equalToConstant: 25),
            taskDescriptionLabel.topAnchor.constraint(equalTo: taskTitleLabel.bottomAnchor, constant: 5),
            taskDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            taskDescriptionLabel.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant: 5),
            taskDescriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
            
        ])
       
    }
}

extension TasksViewCell {
    @objc private func readyButtonTapped() {
        print(#function)
    }
}

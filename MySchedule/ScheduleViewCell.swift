//
//  ScheduleViewCell.swift
//  MySchedule
//
//  Created by Александр Прайд on 28.05.2023.
//

import UIKit

class ScheduleViewCell: UITableViewCell {

    static let identifire = "ScheduleViewCell"
    private let lessonNameLabel: UILabel = UILabel(text: "Аналитическая Психология", font: .avenirBold18(), alignment: .left)
    private let teacherNameLabel: UILabel = UILabel(text: "Карл Густав Юнг", font: .avenirNext18(), alignment: .right)
    private let lessonTimeLabel: UILabel = UILabel(text: "8:00", font: .avenirBold18(), alignment: .left)
    private let typeLabel: UILabel = UILabel(text: "Тип:", font: .avenirNext14(), alignment: .right)
    private let lessonTypeLabel: UILabel = UILabel(text: "Лекция", font: .avenirBold14(), alignment: .left)
    private let buildingLabel: UILabel = UILabel(text: "Корпус:", font: .avenirNext14(), alignment: .right)
    private let lessonBuildingLabel: UILabel = UILabel(text: "1", font: .avenirBold14(), alignment: .left)
    private let audLabel: UILabel = UILabel(text: "Аудитория:", font: .avenirNext14(), alignment: .right)
    private let audCountLabel: UILabel = UILabel(text: "107", font: .avenirBold14(), alignment: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        
        let topStackView: UIStackView = UIStackView(
            arrangedSubviews: [lessonNameLabel, teacherNameLabel],
            axis: .horizontal,
            spacing: 10,
            distribution: .fill)
        
        let bottomStackView: UIStackView = UIStackView(
            arrangedSubviews: [typeLabel, lessonTypeLabel, buildingLabel, lessonBuildingLabel, audLabel, audCountLabel],
            axis: .horizontal,
            spacing: 5,
            distribution: .fillProportionally)
        
        addSubview(topStackView)
        addSubview(lessonTimeLabel)
        addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            topStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            lessonTimeLabel.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 5),
            lessonTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            lessonTimeLabel.widthAnchor.constraint(equalToConstant: 100),
            lessonTimeLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: lessonTimeLabel.trailingAnchor, constant: 5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
}

//
//  TasksViewController.swift
//  MySchedule
//
//  Created by Александр Прайд on 25.05.2023.
//

import UIKit
import FSCalendar

class TasksViewController: UIViewController {
    
    private var calendar: FSCalendar = FSCalendar()
    private var calendarHeightConstraint: NSLayoutConstraint?
    private let showHideButton: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        views()
        layout()
        swipeAction()
    }
}

// MARK: - UI Elements
extension TasksViewController {
    
    private func views() {
        view.backgroundColor = .systemBackground
        
        title = "Задачи"
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.dataSource = self
        calendar.delegate = self
        calendar.scope = .week
        
        showHideButton.translatesAutoresizingMaskIntoConstraints = false
        showHideButton.setTitle("Открыть календарь", for: .normal)
        showHideButton.setTitleColor(.gray, for: .normal)
        showHideButton.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 14)
        showHideButton.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
    }
    
    private func layout() {
        view.addSubview(calendar)
        view.addSubview(showHideButton)
        
        calendarHeightConstraint = NSLayoutConstraint(
            item: calendar,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 300
        )
        guard let calendarHeightConstraint = calendarHeightConstraint else { return }
        calendar.addConstraint(calendarHeightConstraint)
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.topAnchor),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            showHideButton.topAnchor.constraint(equalTo: calendar.bottomAnchor),
            showHideButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            showHideButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    // MARK: - Actions
    @objc private func showHideButtonTapped() {
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            showHideButton.setTitle("Закрыть календарь", for: .normal)
        } else {
            calendar.setScope(.week, animated: true)
            showHideButton.setTitle("Открыть  календарь", for: .normal)
        }
    }
    
    // SwipreGestureRecognizer
    func swipeAction() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeUp.direction = .up
        calendar.addGestureRecognizer(swipeUp)
        
        let swipeDown  = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeDown.direction = .down
        calendar.addGestureRecognizer(swipeDown)
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .up:
            showHideButtonTapped()
        case .down:
            showHideButtonTapped()
        default:
            break
        }
    }
}

// MARK: - FSCalendarDataSource, FSCalendarDelegate
extension TasksViewController: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint?.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
    }
}


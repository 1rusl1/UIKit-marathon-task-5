//
//  PresentedController.swift
//  UIKit-marathon-task5
//
//  Created by Руслан Сабиров on 15/07/2023.
//

import Foundation
import UIKit

class PresentedController: UIViewController {
    lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["280pt", "150pt"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        return control
    }()
    
    private lazy var crossButton: UIButton = {
        let button = UIButton(type: .close)
        button.addTarget(self, action: #selector(crossButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(segmentedControl)
        view.addSubview(crossButton)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            crossButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            crossButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5)
        ])
    }
    
    @objc private func segmentChanged() {
        self.preferredContentSize.height = segmentedControl.selectedSegmentIndex == 0 ? 280 : 150
        view.setNeedsLayout()
    }
    
    @objc private func crossButtonTapped() {
        dismiss(animated: true)
    }
}

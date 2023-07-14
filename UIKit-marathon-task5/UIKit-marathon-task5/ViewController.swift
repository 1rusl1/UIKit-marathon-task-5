//
//  ViewController.swift
//  UIKit-marathon-task5
//
//  Created by Руслан Сабиров on 15/07/2023.
//

import UIKit

class ViewController: UIViewController {
    private lazy var presentButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(presentButton)
        presentButton.setTitle("Present", for: .normal)
        presentButton.titleLabel?.textAlignment = .left
        presentButton.addTarget(self, action: #selector(presentTapped), for: .touchUpInside)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
    }

    private func presentPopover() {
        let presentedController = PresentedController()
        presentedController.modalPresentationStyle = .popover
        presentedController.preferredContentSize = CGSize(width: 300, height: 280)
        guard let popoverController = presentedController.popoverPresentationController else { return }
        popoverController.sourceView = presentButton
        popoverController.sourceRect = presentButton.bounds
        popoverController.permittedArrowDirections = .up
        popoverController.delegate = self
        present(presentedController, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        presentButton.frame.origin = CGPoint(x: view.center.x - presentButton.frame.width / 2, y: 100)
    }
    
    @objc private func presentTapped() {
        presentPopover()
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
            return .none
        }
}

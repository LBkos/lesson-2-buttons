//
//  PresentedViewController.swift
//  lesson2 buttons
//
//  Created by Константин Лопаткин on 05.03.2023.
//

import UIKit
import SwiftUI

class PresentedViewController: UIViewController {
    var label = UILabel()
    
    var stackView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray

        stackView.addArrangedSubview(createLabel())
        stackView.addArrangedSubview(createButton(title: "goBack"))
        stackView.addArrangedSubview(createButton(title: "Go Back To the First View"))
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        stackView.alignment = .center
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func createLabel() -> UILabel {
        label.text = "Present View Controller"
        label.textColor = .white
        label.textAlignment = .center
        
//        label.frame = .init(x: label.frame.origin.x, y: label.frame.origin.y, width: 200, height: 60)
//        label.center.y = view.frame.height / 2
//        label.center.x = view.frame.width / 2
        return label
    }
    
    func createButton(title: String) -> UIButton {
        let backButton = BaseButton()
        backButton.setTitle(title, for: .normal)
        backButton.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        backButton.tintColor = .white
        backButton.imageEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 0)
        backButton.semanticContentAttribute = .forceRightToLeft
        backButton.backgroundColor = .systemBlue
        backButton.layer.cornerRadius = 16
        backButton.contentEdgeInsets = .init(top: 10, left: 14, bottom: 10, right: 14)

        backButton.adjustsImageWhenHighlighted = false
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return backButton
    }
    
    @objc func goBack(_ sender: UIButton!) {
            dismiss(animated: true)
    }
}
struct PresentedViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            PresentedViewController()
        }
    }
}
class BaseButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
        }
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
        }
    }
}

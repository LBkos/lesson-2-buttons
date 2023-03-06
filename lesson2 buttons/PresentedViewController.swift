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
    var color = UIColor.systemBlue
    var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        stackView.addArrangedSubview(createLabel())
        stackView.addArrangedSubview(createButton(title: "goBack", selector: #selector(goBack)))
        stackView.addArrangedSubview(createButton(title: "Go Back To the First View", selector: #selector(goBack)))
        stackView.addArrangedSubview(createButton(title: "next", selector: #selector(nextView)))
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
        return label
    }
    
    func createButton(title: String, selector: Selector) -> UIButton {
        let backButton = BaseButton()
        backButton.setTitle(title, for: .normal)
        backButton.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        backButton.tintColor = .white
        backButton.imageEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 0)
        backButton.semanticContentAttribute = .forceRightToLeft
        backButton.setTitleColor(.white, for: .normal)
        backButton.layer.cornerRadius = 16
        backButton.layer.backgroundColor = UIColor.systemBlue.cgColor
        backButton.contentEdgeInsets = .init(top: 10, left: 14, bottom: 10, right: 14)
        backButton.adjustsImageWhenHighlighted = false
        backButton.addTarget(self, action: selector, for: .touchUpInside)
        return backButton
    }
    
    @objc func goBack(_ sender: UIButton!) {
            dismiss(animated: true)
    }
    
    @objc func nextView(_ sender: UIButton!) {
        let vc = LastViewController()
        present(vc, animated: true)
    }
}
struct PresentedViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            PresentedViewController()
        }
    }
}

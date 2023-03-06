//
//  ViewController.swift
//  lesson2 buttons
//
//  Created by Константин Лопаткин on 04.03.2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    let presVC = PresentedViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button1 = createButton(title: "First Button", action: UIAction { _ in
            print("pressed button 1")
        })
        view.backgroundColor = .white
        view.addSubview(button1)
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        
        let button2 = createButton(title: "Second Medium Button", action: UIAction { _ in
            print("pressed button 2")
        })
        view.addSubview(button2)
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button2.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        
        let button3 = createButton(title: "Third", action: UIAction { _ in
            self.present(self.presVC, animated: true)
        })
        view.addSubview(button3)
        button3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button3.topAnchor.constraint(equalTo: view.topAnchor, constant: 180).isActive = true
        
        let button4 = createButtonUI(title: "WithoutConfig", selector: #selector(pr))
        view.addSubview(button4)
        button4.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button4.topAnchor.constraint(equalTo: button3.topAnchor, constant: 50).isActive = true
        
    }

    func createButton(title: String, action: UIAction) -> UIButton {
        let button = BaseButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.adjustsImageWhenHighlighted = false
        
//        button.setTitle("Text", for: .normal)
        var config = UIButton.Configuration.filled()
        config.title = title
        config.imagePlacement = .trailing
        config.image = .init(systemName: "arrow.right.circle.fill")
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
        config.imagePadding = 8
        config.buttonSize = .large
        config.cornerStyle = .medium
        config.background.backgroundColor = .systemBlue
        config.background.cornerRadius = 16
        
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ container in
            var returned = container
            returned.font = UIFont.preferredFont(forTextStyle: .headline)
            return returned
        })
        config.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        button.configuration = config
        button.configurationUpdateHandler = { button in
            button.isHighlighted = false
        }
        button.setNeedsUpdateConfiguration()
        button.addAction(action, for: .touchUpInside)
        
        return button
    }
    
    func createButtonUI(title: String, selector: Selector) -> UIButton {
        let backButton = BaseButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle(title, for: .normal)
        backButton.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        backButton.tintColor = .white
        backButton.imageEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 0)
        backButton.semanticContentAttribute = .forceRightToLeft
        backButton.setTitleColor(.white, for: .normal)
//        backButton.backgroundColor = .systemBlue
        backButton.layer.cornerRadius = 16
        backButton.layer.backgroundColor = UIColor.systemBlue.cgColor
        backButton.contentEdgeInsets = .init(top: 10, left: 14, bottom: 10, right: 14)
        backButton.adjustsImageWhenHighlighted = false
        backButton.addTarget(self, action: selector, for: .touchUpInside)
//        backButton.tintColorDidChange()
        return backButton
    }
    
    @objc func pr(_ sender: Selector) {
        print("Test")
    }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            ViewController()
        }
    }
}

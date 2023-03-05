//
//  ViewController.swift
//  lesson2 buttons
//
//  Created by Константин Лопаткин on 04.03.2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = createButton(title: "First Button", action: UIAction { _ in
            print("taped button")
        })
        view.addSubview(button1)
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true

        button1.setNeedsUpdateConfiguration()
        
        let button2 = createButton(title: "Second Medium Button", action: UIAction { _ in
            print("taped button")
        })
        view.addSubview(button2)
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button2.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        button2.setNeedsUpdateConfiguration()
        
        let button3 = createButton(title: "Third", action: UIAction { _ in
            self.present(PresentedViewController(), animated: true)
        })
        view.addSubview(button3)
        button3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button3.topAnchor.constraint(equalTo: view.topAnchor, constant: 180).isActive = true
        button3.setNeedsUpdateConfiguration()
        
        
    }

    func createButton(title: String, action: UIAction) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Text", for: .normal)
        var config = UIButton.Configuration.filled()
        config.title = title
        config.imagePlacement = .trailing
        config.image = .init(systemName: "arrow.right.circle.fill")
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
        config.imagePadding = 8
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ container in
            var returned = container
            returned.font = UIFont.preferredFont(forTextStyle: .headline)
            return returned
        })
        
        config.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        button.configuration = config
        
        button.configurationUpdateHandler = { button in
            button.isHighlighted = false
            
            if button.isTouchInside {
                button.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
            } else {
                button.transform = CGAffineTransform.identity
            }
        }
        
        button.addAction(action, for: .touchUpInside)
        
        return button
    }

}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            ViewController()
        }
    }
}

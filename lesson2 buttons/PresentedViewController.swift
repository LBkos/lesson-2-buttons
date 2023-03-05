//
//  PresentedViewController.swift
//  lesson2 buttons
//
//  Created by Константин Лопаткин on 05.03.2023.
//

import UIKit

class PresentedViewController: UIViewController {
    var label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Present View Controller"
        label.textColor = .white
        label.textAlignment = .center
        label.frame = .init(x: label.frame.origin.x, y: label.frame.origin.y, width: 200, height: 60)
        label.center.y = view.frame.height / 2
        label.center.x = view.frame.width / 2

        view.backgroundColor = .darkGray
        view.addSubview(label)
        
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
    }
}

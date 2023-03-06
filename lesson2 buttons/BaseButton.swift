//
//  BaseButton.swift
//  lesson2 buttons
//
//  Created by Константин Лопаткин on 06.03.2023.
//

import UIKit

class BaseButton: UIButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.transform = self.transform.scaledBy(x: 0.90, y: 0.90)
        }
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()
        if tintAdjustmentMode == .dimmed {
            configuration?.background.backgroundColor = .systemGray
            layer.backgroundColor = UIColor.systemGray.cgColor
        } else {
            configuration?.background.backgroundColor = .systemBlue
            layer.backgroundColor = UIColor.systemBlue.cgColor
            layer.cornerRadius = 16
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


//
//  FadeEnabledButton.swift
//  StarTrivia
//
//  Created by Luca Lo Forte on 01/02/2019.
//  Copyright © 2019 Luca Lo Forte. All rights reserved.
//

import UIKit

class FadeEnabledButton: UIButton {
    override var isEnabled: Bool {
        didSet {
            if isEnabled  {
                UIView.animate(withDuration: 0.2) {
                     self.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}

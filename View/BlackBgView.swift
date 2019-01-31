//
//  StackRoundedView.swift
//  StarTrivia
//
//  Created by Luca Lo Forte on 31/01/2019.
//  Copyright © 2019 Luca Lo Forte. All rights reserved.
//

import UIKit

class BlackBgView: UIView {

    override func awakeFromNib() {
        self.layer.backgroundColor = BLACK_BG
        self.layer.cornerRadius = 10
    }

}

class BlackBgButton: UIButton {
    
    override func awakeFromNib() {
        self.layer.backgroundColor = BLACK_BG
        self.layer.cornerRadius = 10
    }
    
}

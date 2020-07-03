//
//  BlackBgView.swift
//  StarWarsAPI
//
//  Created by PHANTOM on 19/06/20.
//  Copyright © 2020 Dzulfikar Ali. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 15
        
    }
}

class BlackBgButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.backgroundColor = blackBG
        layer.cornerRadius = 10
    }
}


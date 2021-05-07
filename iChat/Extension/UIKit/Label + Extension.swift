//
//  Label + Extension.swift
//  iChat
//
//  Created by MacBookPro on 06.05.2021.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        self.text = text
        self.font = font
    }
}

//
//  SelfconfiguringCell.swift
//  iChat
//
//  Created by MacBookPro on 14.05.2021.
//

import Foundation

protocol SelfconfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}

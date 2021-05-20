//
//  UserError.swift
//  iChat
//
//  Created by MacBookPro on 20.05.2021.
//

import Foundation

enum UserError {
    case notFilled
    case photoDescription
    
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        
        
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .photoDescription:
            return NSLocalizedString("Пользователь не выбрал фотографию", comment: "")
        }
        
    }
}

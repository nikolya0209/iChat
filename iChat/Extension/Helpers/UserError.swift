//
//  UserError.swift
//  iChat
//
//  Created by MacBookPro on 20.05.2021.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExist
    case cannotUserInfo
    case cannotUnwrapToUser
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .photoNotExist:
            return NSLocalizedString("Пользователь не выбрал фотографию", comment: "")
        case .cannotUserInfo:
            return NSLocalizedString("Невозможно загузить информацию о User из Firebase", comment: "")
        case .cannotUnwrapToUser:
            return NSLocalizedString("Невозможно конвертировать Muser из User", comment: "")
        }
        
    }
}

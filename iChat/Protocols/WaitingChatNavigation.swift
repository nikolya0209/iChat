//
//  WaitingChatNavigation.swift
//  iChat
//
//  Created by MacBookPro on 26.05.2021.
//

import Foundation

protocol WaitingChatNavigation: class {
    func removeWaitingChat(chat: MChat)
    func chatToActive(chat: MChat)
}

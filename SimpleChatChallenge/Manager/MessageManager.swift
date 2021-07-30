//
//  messageManager.swift
//  SimpleChatChallenge
//
//  Created by Miguel Angel Askar Rodriguez on 29/07/21.
//

import Foundation

class MessageManager {
    
    static let shared = MessageManager()
    
    private(set) var messages: [Message] = []
    
    init() {
        self.messages = Serialization.load(fromJSON: "messages") ?? []
    }
    
    func add(message: Message) {
        messages.append(message)
    }
}

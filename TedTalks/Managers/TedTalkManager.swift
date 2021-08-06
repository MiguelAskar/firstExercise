//
//  TedTalkManager.swift
//  TedTalks
//
//  Created by Miguel Angel Askar Rodriguez on 4/08/21.
//

import Foundation

class TedTalkManager {
    
    private(set) var tedTalks: [TedTalk] = []
    
    init() {
        self.tedTalks = Serialization.load(fromJSON: "ted") ?? []
    }
    
    func add(tedTalk: TedTalk) {
        tedTalks.append(tedTalk)
    }
}

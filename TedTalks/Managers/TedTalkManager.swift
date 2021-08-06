//
//  TedTalkManager.swift
//  TedTalks
//
//  Created by Miguel Angel Askar Rodriguez on 4/08/21.
//

import Foundation

class TedTalkManager {
    
    private(set) var tedTalks: [TedTalk] = []
    private(set) var filteredTedTalks: [TedTalk] = []
    
    init() {
        self.tedTalks = Serialization.load(fromJSON: "ted") ?? []
        self.filteredTedTalks = self.tedTalks
    }
    
    func add(tedTalk: TedTalk) {
        tedTalks.append(tedTalk)
    }
    
    func filter(keyword: String, filter: String) {
        filteredTedTalks = keyword=="" ? tedTalks.filter{ doesTedTalkMatch(keyword, filter, $0)} : tedTalks
    }
    
    func doesTedTalkMatch(_ keyword: String,_ filter: String,_ tedTalk: TedTalk) -> Bool {
        switch filter {
        case "All filters":
            return doesAnyFilterMatch(keyword, tedTalk)
        case "Event":
            return tedTalk.event.contains(keyword)
        case "Main speaker":
            return tedTalk.mainSpeaker.contains(keyword)
        case "Title":
            return tedTalk.title.contains(keyword)
        case "Name":
            return tedTalk.name.contains(keyword)
        case "Description":
            return tedTalk.description.contains(keyword)
        default:
            return false
        }
    }
    
    func doesAnyFilterMatch(_ keyword: String,_ tedTalk: TedTalk) -> Bool {
        return tedTalk.event.contains(keyword) || tedTalk.mainSpeaker.contains(keyword) || tedTalk.title.contains(keyword) || tedTalk.name.contains(keyword) || tedTalk.description.contains(keyword)
    }
}

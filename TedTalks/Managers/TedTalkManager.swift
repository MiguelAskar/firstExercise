//
//  TedTalkManager.swift
//  TedTalks
//
//  Created by Miguel Angel Askar Rodriguez on 4/08/21.
//

import Foundation

class TedTalkManager {
    
    private var tedTalks: [TedTalk] = []
    private(set) var filteredTedTalks: [TedTalk] = []
    
    init() {
        self.tedTalks = Serialization.load(fromJSON: "ted") ?? []
        self.filteredTedTalks = self.tedTalks
    }
    
    func add(tedTalk: TedTalk) {
        tedTalks.append(tedTalk)
    }
    
    func filter(keyword: String, filter: TedTalkFilters) {
        filteredTedTalks = keyword != "" ? tedTalks.filter { doesTedTalkMatch(keyword, filter, $0) } : tedTalks
    }
    
    func doesTedTalkMatch(_ keyword: String,_ filter: TedTalkFilters,_ tedTalk: TedTalk) -> Bool {
        switch filter {
            case .allFilters:
                return doesAnyFilterMatch(keyword, tedTalk)
            case .event:
                return tedTalk.event.contains(keyword)
            case .mainSpeaker:
                return tedTalk.mainSpeaker.contains(keyword)
            case .title:
                return tedTalk.title.contains(keyword)
            case .name:
                return tedTalk.name.contains(keyword)
            case .description:
                return tedTalk.description.contains(keyword)
        }
    }
    
    func doesAnyFilterMatch(_ keyword: String,_ tedTalk: TedTalk) -> Bool {
        return tedTalk.event.contains(keyword) || tedTalk.mainSpeaker.contains(keyword) || tedTalk.title.contains(keyword) || tedTalk.name.contains(keyword) || tedTalk.description.contains(keyword)
    }
}

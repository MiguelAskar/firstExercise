//
//  Enumerations.swift
//  TedTalks
//
//  Created by Miguel Angel Askar Rodriguez on 9/08/21.
//

import Foundation

enum TedTalkFilters : String {
    case allFilters = "All filters"
    case event = "Event"
    case mainSpeaker = "Main speaker"
    case title = "Title"
    case name = "Name"
    case description = "Description"
    
    func getName() -> String {
        return self.rawValue
    }
}

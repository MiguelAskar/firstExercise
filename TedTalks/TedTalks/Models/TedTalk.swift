//
//  TedTalk.swift
//  TedTalks
//
//  Created by Miguel Angel Askar Rodriguez on 3/08/21.
//

import Foundation

struct TedTalk: Codable {
    
    let languages: UInt
    let comments: UInt
    let description: String
    let views: UInt
    let event: String
    let url: URL
    let tags: [String]
    let title: String
    let numSpeaker: UInt
    let filmDate: UInt
    let mainSpeaker: String
    let thumbnail: URL?
    let duration: UInt
    let published_date: UInt
    let name: String
    let speakerOccupation: String
    
    enum CodingKeys: String, CodingKey{
        
        case numSpeaker = "num_speaker"
        case filmDate = "film_date"
        case mainSpeaker = "main_speaker"
        case speakerOccupation = "speaker_occupation"
        //Next ones remains the same
        case languages, comments, description, views, event, url, tags, title, thumbnail, duration, published_date, name
    }
    
}

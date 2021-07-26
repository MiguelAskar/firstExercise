//
//  Serialization.swift
//  Contacts
//
//  Created by Camilo Andres Morales Perez on 22/07/21.
//

import Foundation

struct Serialization {
    static func load<T: Codable>(fromJSON resource: String) -> T? {
        guard let filePath = Bundle.main.path(forResource: resource, ofType: "json"),
              let jsonData = NSData.init(contentsOfFile: filePath) else { return nil }
            do {
                return try JSONDecoder().decode(T.self, from: jsonData as Data)
            } catch {
                print("[Serialization] Error loading JSON resource: \(error)")
            }
        return nil
    }
}

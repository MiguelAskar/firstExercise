//
//  Contact.swift
//  Contacts
//
//  Created by Camilo Andres Morales Perez on 22/07/21.
//

import Foundation

struct Contact: Codable {
    let name: String
    let lastName: String?
    let phone: String
    let email: String?
}

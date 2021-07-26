//
//  ContactManager.swift
//  Contacts
//
//  Created by Camilo Andres Morales Perez on 22/07/21.
//

import Foundation

class ContactManager {

    static let shared = ContactManager()

    private(set) var contacts: [Contact] = []

    init() {
        self.contacts = Serialization.load(fromJSON: "contacts") ?? []
    }

    func add(contact: Contact) {
        contacts.append(contact)
    }

}

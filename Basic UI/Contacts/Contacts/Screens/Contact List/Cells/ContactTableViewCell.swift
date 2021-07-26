//
//  ContactTableViewCell.swift
//  Contacts
//
//  Created by Miguel Angel Askar Rodriguez on 22/07/21.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
       
    @IBOutlet weak var nameLabel: UILabel!
        
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with contact: Contact){
        nameLabel.text = contact.name
        lastNameLabel.text = contact.lastName ?? "-"        
    }

}

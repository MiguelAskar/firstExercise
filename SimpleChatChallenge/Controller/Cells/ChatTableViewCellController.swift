//
//  ChatTableViewCellController.swift
//  SimpleChatChallenge
//
//  Created by Miguel Angel Askar Rodriguez on 29/07/21.
//

import UIKit

class ChatTableViewCellController: UITableViewCell {

    
    @IBOutlet weak var senderLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
        
    @IBOutlet weak var hourLabel: UILabel!
    
    
    @IBOutlet weak var topForChatCellConstraint: NSLayoutConstraint!
        
    @IBOutlet weak var trailingForChatCellConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leadingForChatCellConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topForBottomCellConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var backgroundCellView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundCellView.layer.cornerRadius = 20
        backgroundCellView.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill(with message: Message){
        let amISender = message.username == "Me"
        senderLabel.text = (amISender ? "" : message.username)
        leadingForChatCellConstraint.constant = (amISender ? 125 : 8)
        trailingForChatCellConstraint.constant = (amISender ? 40 : 200)
        topForChatCellConstraint.constant = (amISender ? 10 : 20)
        backgroundCellView.backgroundColor = (amISender ? backgroundCellView.backgroundColor : .none)
        messageLabel.text = message.message
        hourLabel.text = message.timeMessage
        
    }

}

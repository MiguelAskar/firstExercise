//
//  TedTalksTableViewCell.swift
//  TedTalks
//
//  Created by Miguel Angel Askar Rodriguez on 4/08/21.
//

import UIKit

class TedTalkTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!    
    @IBOutlet weak var thumbnailmageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentMode = .scaleAspectFit
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill(with tedTalk: TedTalk) {
        titleLabel.text = tedTalk.title
        descriptionLabel.text = tedTalk.description
        thumbnailmageView.image = nil
        guard let thumbnailURL = tedTalk.thumbnail else { return }
        thumbnailmageView.downloaded(from: thumbnailURL)
    }

}

//
//  tedTalkDetailViewController.swift
//  TedTalks
//
//  Created by Miguel Angel Askar Rodriguez on 5/08/21.
//

import UIKit

import WebKit

class TedTalkDetailViewController: UIViewController {
    
    var tedTalk: TedTalk?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var talkWebView: WKWebView!
    
    @IBOutlet weak var viewsLabel: UILabel!
    
    @IBOutlet weak var uploadDateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var conferenceDateLabel: UILabel!
    
    @IBOutlet weak var tagsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tedTalk = tedTalk else {
            dismiss(animated: true, completion: nil)
            return
        }
        fill(with: tedTalk)
        
        

        // Do any additional setup after loading the view.
    }
    
    func fill(with tedTalk: TedTalk) {
        
        titleLabel.text = tedTalk.title
        
        //talkWebView.text
        
        viewsLabel.text = "\(tedTalk.views)"
        
        uploadDateLabel.text = "\(tedTalk.published_date)"
        
        descriptionLabel.text = tedTalk.description
        
        authorLabel.text = tedTalk.mainSpeaker
        
        conferenceDateLabel.text = "\(tedTalk.filmDate)"
        
        tagsLabel.text = tedTalk.tags.joined(separator: ", ")
    }
    

        

}

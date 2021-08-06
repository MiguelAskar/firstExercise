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
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var conferenceDateLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!    
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        guard let tedTalk = tedTalk else {
            dismiss(animated: true, completion: nil)
            return
        }
        fill(with: tedTalk)
    }
    
    func fill(with tedTalk: TedTalk) {
        
        titleLabel.text = tedTalk.title
        let tedTalkURL = tedTalk.url
        let request = URLRequest(url: tedTalkURL)
        talkWebView.load(request)
        viewsLabel.text = "\(tedTalk.views) views"
        uploadDateLabel.text = "Published in \(formatDate(from: tedTalk.published_date))"
        descriptionTextView.text = "Description: \(tedTalk.description)"
        authorLabel.text = "Main speaker: \(tedTalk.mainSpeaker)"
        conferenceDateLabel.text = "Recorded in \(formatDate(from: tedTalk.filmDate))"
        tagsLabel.text = "Tags: \(tedTalk.tags.joined(separator: ", "))"
    }
    
    func formatDate(from date: UInt) -> String {
        let timeInterval = Double(date)
        let myDate = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL-dd-yyyy"
        return dateFormatter.string(from: myDate)
    }

}

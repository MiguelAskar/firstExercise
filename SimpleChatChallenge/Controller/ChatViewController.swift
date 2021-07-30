//
//  ChatViewController.swift
//  SimpleChatChallenge
//
//  Created by Miguel Angel Askar Rodriguez on 29/07/21.
//

import UIKit

class ChatViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }    

}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageManager.shared.messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCellController", for: indexPath) as! ChatTableViewCellController
        
        cell.fill(with: MessageManager.shared.messages[indexPath.row])
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.estimatedRowHeight = 10
        return cell
    }
    
    
        
}

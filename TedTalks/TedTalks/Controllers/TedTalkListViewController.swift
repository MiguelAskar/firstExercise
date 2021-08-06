//
//  TedTalksListViewController.swift
//  TedTalks
//
//  Created by Miguel Angel Askar Rodriguez on 4/08/21.
//

import UIKit

class TedTalkListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let tedTalkManager: TedTalkManager = TedTalkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Selected Ted talks for you"
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension

    }
    
    
    func showTedTalkDetail(_ tedTalk: TedTalk) {
        guard let viewController = storyboard?.instantiateViewController(identifier: "TedTalkDetailViewController") else { return }
        guard let tedTalkDetailVC = viewController as? TedTalkDetailViewController else { return }
        
        tedTalkDetailVC.tedTalk = tedTalk
        
        navigationController?.pushViewController(tedTalkDetailVC, animated: true)
    }

}

extension TedTalkListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tedTalkManager.tedTalks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TedTalkTableViewCell") as! TedTalkTableViewCell
        
        cell.fill(with: tedTalkManager.tedTalks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showTedTalkDetail(tedTalkManager.tedTalks[indexPath.row])
    }

    
    
}

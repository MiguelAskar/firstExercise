//
//  TedTalksListViewController.swift
//  TedTalks
//
//  Created by Miguel Angel Askar Rodriguez on 4/08/21.
//

import UIKit

class TedTalksListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let tedTalkManager: TedTalkManager = TedTalkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Selected Ted talks for you"
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        
        

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TedTalksListViewController: UITableViewDelegate, UITableViewDataSource {
    
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
    }
    
    
}

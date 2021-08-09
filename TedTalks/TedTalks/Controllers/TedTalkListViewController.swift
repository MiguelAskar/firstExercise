//
//  TedTalksListViewController.swift
//  TedTalks
//
//  Created by Miguel Angel Askar Rodriguez on 4/08/21.
//

import UIKit

class TedTalkListViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tedTalksSearchBar: UISearchBar!
    
    @IBOutlet weak var tedTalksFilterPickerView: UIPickerView!
    
    private var pickerData: [TedTalkFilters] = [.allFilters, .event, .mainSpeaker, .title, .name, .description]
    
    private var selectedFilter = TedTalkFilters.allFilters
    
    private let tedTalkManager: TedTalkManager = TedTalkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Selected Ted talks for you"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tedTalksFilterPickerView.delegate = self
        tedTalksFilterPickerView.dataSource = self
        tedTalksSearchBar.delegate = self
    }
    
    
    func showTedTalkDetail(_ tedTalk: TedTalk) {
        guard let viewController = storyboard?.instantiateViewController(identifier: "TedTalkDetailViewController") else { return }
        guard let tedTalkDetailVC = viewController as? TedTalkDetailViewController else { return }
        
        tedTalkDetailVC.tedTalk = tedTalk
        
        navigationController?.pushViewController(tedTalkDetailVC, animated: true)
    }
    
}

extension TedTalkListViewController: UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource, UISearchBarDelegate{
    
    //**************Ted talk Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tedTalkManager.filteredTedTalks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TedTalkTableViewCell") as! TedTalkTableViewCell
        
        cell.fill(with: tedTalkManager.filteredTedTalks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showTedTalkDetail(tedTalkManager.filteredTedTalks[indexPath.row])
    }
    
    //**************Ted talk Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].getName()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedFilter = pickerData[row]
        tedTalkManager.filter(keyword: tedTalksSearchBar.text ?? "", filter: self.selectedFilter)
        tableView.reloadData()
    }
    
    //**************Search bar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tedTalkManager.filter(keyword: searchText, filter: selectedFilter)
        tableView.reloadData()
    }
    
}

//
//  ConactListViewController.swift
//  Contacts
//
//  Created by Miguel Angel Askar Rodriguez on 22/07/21.
//

import UIKit

class ContactListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact List"
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func showContactDetail(_ contact: Contact){
        guard let viewController = storyboard?.instantiateViewController(identifier: "ContactDetailViewController") else { return }
        guard let contactDetailVC = viewController as? ContactDetailViewController else { return }
        
        contactDetailVC.contact = contact
        
        //navigationController?.pushViewController(contactDetailVC, animated: true)
        
        //contactDetailVC.modalPresentationStyle= .fullScreen
        //contactDetailVC.modalTransitionStyle= .crossDissolve
        
        present(contactDetailVC, animated: true, completion: nil)
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

extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactManager.shared.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        //cell.textLabel?.text = ContactManager.shared.contacts[indexPath.row].name
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as! ContactTableViewCell

        cell.configure(with: ContactManager.shared.contacts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showContactDetail(ContactManager.shared.contacts[indexPath.row])
    }
    
}

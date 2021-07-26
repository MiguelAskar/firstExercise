//
//  DetailViewController.swift
//  MemoryManagement
//
//  Created by Camilo Andres Morales Perez on 21/07/21.
//

import UIKit

class DetailModel {

    // Causes a leak
    var vc: DetailViewController

    // Doesn't cause a leak
    // weak var vc: DetailViewController?

    init(vc: DetailViewController) {
        self.vc = vc
    }

}

class DetailViewController: UIViewController {

    var model: DetailModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let dismissButton = UIButton(type: .system)
        dismissButton.setTitle("Close Detail", for: .normal)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dismissButton)
        NSLayoutConstraint.activate([
            dismissButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        dismissButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    }

    @objc
    func close() {
        dismiss(animated: true, completion: nil)
    }

}

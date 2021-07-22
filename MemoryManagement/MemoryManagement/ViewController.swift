//
//  ViewController.swift
//  MemoryManagement
//
//  Created by Camilo Andres Morales Perez on 21/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let detailButton = UIButton(type: .system)
        detailButton.setTitle("Detail", for: .normal)
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailButton)
        NSLayoutConstraint.activate([
            detailButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        detailButton.addTarget(self, action: #selector(showDetail), for: .touchUpInside)
    }

    @objc
    func showDetail() {
        let dvc = DetailViewController()
        dvc.model = DetailModel(vc: dvc)
        present(dvc, animated: true, completion: nil)
    }
}


//
//  ViewController.swift
//  Delegates
//
//  Created by Camilo Andres Morales Perez on 21/07/21.
//

import UIKit

class ViewController: UIViewController {

    let table = MyTable()

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.displayRows()
    }

}

extension ViewController: TableDataSource, TableDelegate {
    func displayedRow(at index: Int) {
        print("Row displayed at \(index)")
    }

    func numberOfRows() -> Int {
        return 10
    }
}


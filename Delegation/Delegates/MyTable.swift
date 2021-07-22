//
//  MyTable.swift
//  Delegates
//
//  Created by Camilo Andres Morales Perez on 21/07/21.
//

import Foundation

protocol TableDelegate: AnyObject {
    func displayedRow(at index: Int)
}

protocol TableDataSource: AnyObject {
    func numberOfRows() -> Int
}

class MyTable {

    weak var delegate: TableDelegate?
    weak var dataSource: TableDataSource?

    func displayRows() {
        guard let dataSource = dataSource else { return }
        for i in 0..<dataSource.numberOfRows() {
            delegate?.displayedRow(at: i)
        }
    }

}

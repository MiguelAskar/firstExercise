//
//  ViewController.swift
//  TryCatch
//
//  Created by Camilo Andres Morales Perez on 21/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let numbers = [1,2,3]
        // Guard try? - try? makes the return value optional, so if the tgrowing function fails, no error will be thrown and result would be nil

        guard let result = try? add(numbers) else { return }
        print(result)

        // Never do this, if add() throws this will cause a run-time crash

        let result2 = try! add(numbers)
        print(result2)

        // do / catch will let you catch the error if thrown

        do {
            let result = try add(numbers)
            print(result)
        } catch {
            print(error)
        }
    }


    func add(_ numbers: [Int]) throws -> Int  {
        guard numbers.count > 0 else {
            throw(NSError(domain: "[TryCatchDemo] Numbers must cointain at least one number", code: -100, userInfo: nil))
        }
        return numbers.reduce(0, +)
    }

}


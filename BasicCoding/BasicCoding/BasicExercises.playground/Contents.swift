import UIKit

//Exercise 1:

let distance: UInt = 15

switch distance {
    case 0:
        print("Here")
    case 0..<5:
        print("Inmediate vicinity")
    case 5...15:
        print("Near")
    case 16...40:
        print("Kind of far")
    default:
        print("Far")
}

//Exercise 2

func comparator(_ array: [Int], _ number: Int) {
    var greaterCounter = 0
    var lowerCounter = 0
    for item in array {
        if item > number {
            greaterCounter += 1
        } else if item < number {
            lowerCounter += 1
        }
    }
    print("There are \(lowerCounter) numbers lower and \(greaterCounter) greater than \(number)")
}

let array = [110, 20, 100, 0, 200]
let number = 100

comparator(array, number)

let number2 = 101

comparator(array, number2)


//Exercise 3

func printIfPositiveInteger(number: String) {
  guard let value = Int(number), value >= 0  else {
      return
  }
  print(value)
}

printIfPositiveInteger(number: "abc")
printIfPositiveInteger(number: "-10")
printIfPositiveInteger(number: "10")

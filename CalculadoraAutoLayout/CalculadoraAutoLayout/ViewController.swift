//
//  ViewController.swift
//  CalculadoraAutoLayout
//
//  Created by Ana Pontes on 20/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var firstNum: String = ""
    var operation: String = ""
    var secondNum: String = ""
    var haveResult: Bool = false
    var resultNum: String = ""
    var numAfterResults: String = ""
    
    @IBAction func add(_ sender: Any) {
        operation = "+"
        numOnScreen.text! += "+"
    }
    
    @IBAction func sub(_ sender: Any) {
        operation = "-"
        numOnScreen.text! += "-"
    }
    
    @IBAction func multi(_ sender: Any) {
        operation = "x"
        numOnScreen.text! += "x"
    }
    
    @IBAction func div(_ sender: Any) {
        operation = "/"
        numOnScreen.text! += "/"
    }
    
    @IBAction func equal(_ sender: Any) {
//        resultNum = String(performOperation(operation: ""))
//        numOnScreen.text = resultNum
//        numAfterResults = ""
//
        performOperation(operation: operation)
        numAfterResults = ""
    }
    

    
    @IBAction func numPressed(_ sender: UIButton) {

        if operation == "" {
            firstNum += String(sender.tag)
            numOnScreen.text = firstNum
        } else if operation != "" && !haveResult {
            secondNum += String(sender.tag)
            numOnScreen.text = secondNum
        } else if operation != "" && haveResult {
            numAfterResults += String(sender.tag)
            numOnScreen.text = numAfterResults
}
       
    
    
    }
    
    
    @IBAction func clearButton(_ sender: Any) {
            firstNum = ""
           secondNum = ""
           resultNum = ""
           numAfterResults = ""
           haveResult = false
           operation = ""
           numOnScreen.text = "0"
        
    }
    
    @IBOutlet weak var numOnScreen: UILabel!
    
    @IBOutlet var calcButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for button in calcButton {
            button.layer.cornerRadius = button.frame.size.height / 2
            button.titleLabel?.font = UIFont(name: "System", size: 24)
        }
    }
    
//    func doOperation() -> Double {
//        if operation == "+" {
//            if !haveResult {
//                haveResult = true
//                return Double(firstNum)! + Double(numAfterResults)!
//            } else {
//                return Double(resultNum)! + Double(numAfterResults)!
//            }
//        }
//        else if operation == "-" {
//            if !haveResult {
//                haveResult = true
//                return Double(firstNum)! - Double(secondNum)!
//            } else {
//                return Double(resultNum)! - Double(numAfterResults)!
//            }
//        }
//        else if operation == "x" {
//            if !haveResult {
//                haveResult = true
//                return Double(firstNum)! * Double(secondNum)!
//            } else {
//                return Double(resultNum)! * Double(numAfterResults)!
//            }
//        }
//        else if operation == "/" {
//            if !haveResult {
//                haveResult = true
//                return Double(firstNum)! / Double(secondNum)!
//            } else {
//                return Double(resultNum)! / Double(numAfterResults)!
//            }
//        }
//        return 0
//    }
    func performOperation(operation: String) {
        switch operation {
        case "+":
            if let firstNum = Double(firstNum), let secondNum = Double(secondNum) {
                resultNum = String(firstNum + secondNum + 1)
                haveResult = true
                
            }
        case "-":
            if let firstNum = Double(firstNum), let secondNum = Double(secondNum) {
                resultNum = String(firstNum - secondNum)
                haveResult = true
            }
        case "x":
            if let firstNum = Double(firstNum), let secondNum = Double(secondNum) {
                resultNum = String(firstNum * secondNum)
                haveResult = true
            }
        case "/":
            if let firstNum = Double(firstNum), let secondNum = Double(secondNum), secondNum != 0 {
                resultNum = String(firstNum / secondNum)
                haveResult = true
            } else {
                numOnScreen.text = "Error"
                clearButton(self)
            }
        default:
            break
        }
        numOnScreen.text = resultNum
        numAfterResults = secondNum
        firstNum = resultNum
        secondNum = ""
        self.operation = ""
    }

}

//
//  ViewController.swift
//  Calculator
//
//  Created by 206568245 on 3/9/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var displayLabel: UILabel!

    /*
     ACCESS LEVELS

     1. private: accessible in the local block
     2. fileprivate: only accessible inside the file declared
     3. internal: accessible anywhere in the module (default)
     4. public: accessible from other modules
     5. open: public + available to subclass and override
    */
    private var isFinishedTyping: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true

        guard let number = Double(displayLabel.text!) else {
            fatalError("Error converting display label text to Double.")
        }

        guard let calcMethod = sender.currentTitle else {
            fatalError("Error determining calculation method requested.")
        }

        switch calcMethod {
        case "+/-":
            displayLabel.text = String(number * -1)
        case "%":
            displayLabel.text = String(number * 0.01)
        default:
            displayLabel.text = "0"
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {

        guard let numValue = sender.currentTitle else { return }

        if isFinishedTyping {
            if numValue == "." {
                displayLabel.text = "0" + numValue
            } else {
                displayLabel.text = numValue
            }

            isFinishedTyping = false
        } else {

            if numValue == "." {
                guard let currentDisplayValue = Double(displayLabel.text!) else {
                    fatalError("Error converting display label text to Double.")
                }

                guard floor(currentDisplayValue) == currentDisplayValue else { return }
            }

            displayLabel.text?.append(numValue)
        }
    }

}

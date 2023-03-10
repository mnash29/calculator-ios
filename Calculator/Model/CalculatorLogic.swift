//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by 206568245 on 3/10/23.
//

import Foundation

class CalculatorLogic {

    var number: Double

    init(_ number: Double) {
        self.number = number
    }

    func performCalculation(with value: Double, symbol: String) -> Double {

        switch symbol {
        case "+/-":
            number = value * -1
        case "%":
            number = value * 0.01
        default:
            number = 0
        }

        return number
    }
}

//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by 206568245 on 3/10/23.
//

import Foundation

/*
 Struct

 Quicker: stored in stack vs heap
 Immutable
 Deep Copy
 Threadsafe

 Class

 Inheritance
 Required if working with objective-c modules

 */
struct CalculatorLogic {

    private var number: Double?
    private var intermediateCalculation: (operand: Double, method: String)?

    mutating func setNumber(to number: Double) {
        self.number = number
    }

    mutating func performOperation(with symbol: String) -> Double? {

        guard let value = number else { return nil }

        switch symbol {
        case "+/-":
            return value * -1
        case "%":
            return value * 0.01
        case "AC":
            return 0
        case "=":
            return performCalculation(with: value)
        default:
            intermediateCalculation = (operand: value, method: symbol)
        }

        return nil
    }

    private func performCalculation(with rightOperand: Double) -> Double? {

        guard let leftOperand = intermediateCalculation?.operand else { return nil }

        guard let method = intermediateCalculation?.method else { return nil }

        switch method {
        case "+":
            return leftOperand + rightOperand
        case "-":
            return leftOperand - rightOperand
        case "×":
            return leftOperand * rightOperand
        default:
            return leftOperand / rightOperand
        }
    }
}

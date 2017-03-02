//
//  Calculator.swift
//  Calculator_14-02-2017
//
//  Created by Gabriele Suerz on 14/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

import Foundation

class Calculator {
    
    private var numb1 = ""
    private var numb2 = ""
    private var op = ""
    
    private func numberPressed (number: String) {
        numb1 == "" ? (numb1 = number) : (numb2 = number)
    }
    
    func operatorPressed (operatorP: String, number: String) -> String {
        var result = 0.0
        numberPressed(number: number)
        if op == "" {
            op = operatorP
            return ""
        } else {
            result = operation()
            if operatorP == "=" {
                op = ""
                numb1 = ""
            } else {
                op = operatorP
                numb1 = "\(result)"
            }
            numb2 = ""
            return String(format:"%g", result)
        }
    }
    
    private func operation() -> Double {
        var result = 0.0
        let n1 = Double(numb1)!
        let n2 = Double(numb2)!
        if op == "+" {
            result = n1 + n2
        } else if op == "-" {
            result = n1 - n2
        } else if op == "*" {
            result = n1 * n2
        } else if op == "/" {
            result = n1 / n2
        }
        return result
    }
    
    func deleteAll() {
        numb1 = ""
        numb2 = ""
        op = ""
    }
    
}

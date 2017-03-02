//
//  ViewController.swift
//  Calculator_14-02-2017
//
//  Created by Gabriele Suerz on 14/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var numb = ""
    private let calc = Calculator ()
    
    @IBOutlet weak internal var display: UILabel!

    @IBAction func buttonPressed(_ sender: UIButton) {
        checkPress(sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkPress(sender: UIButton) {
        
        let originalStr = sender.currentTitle
        let isNumber =  Int(originalStr!)
        let res: String
        
        
        if isNumber != nil {
            numb = numb + originalStr!
            display.text = numb
        } else {
            if originalStr == "CE" {
                calc.deleteAll()
                numb = ""
                display.text = numb
            } else if originalStr == "C" {
                numb = ""
                display.text = numb
            } else if (originalStr == "DEL") {
                numb = numb.substring(to: numb.index(before: numb.endIndex))
                display.text = numb
            } else if originalStr == "+/-" {
                if numb.substring(to: numb.startIndex) == "-" {
                    numb = "-" + numb
                } else {
                    numb = numb.substring(to: numb.index(after: numb.startIndex))
                }
                display.text = numb
            } else if originalStr == "." {
                numb = numb + originalStr!
                display.text = numb
            } else {
                res = calc.operatorPressed(operatorP: originalStr!, number: numb)
                numb = ""
                res == "" ? (display.text =  sender.currentTitle) : (display.text = res)
            }
        }
    }

}


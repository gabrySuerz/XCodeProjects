//
//  ViewController.swift
//  SuerzGabriele
//
//  Created by Gabriele Suerz on 02/03/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

import UIKit


class ViewController: UIViewController, ColorDelegate{

    @IBOutlet weak var buttonPush: UIButton!
    
    @IBOutlet weak var buttonModal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //CGRect
    }
    
    override func viewDidLayoutSubviews() {
        buttonModal.layer.cornerRadius = 0.5 * buttonModal.bounds.size.width
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Delegate

    func setButtonColor(buttonColor: UIColor){
        buttonPush.backgroundColor = buttonColor
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "colorView" {
            let clv = segue.destination as! ColorViewController
            clv.delegate = self
        }
    }
    
}


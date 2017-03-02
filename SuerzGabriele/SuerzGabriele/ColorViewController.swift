//
//  ColorViewController.swift
//  SuerzGabriele
//
//  Created by Gabriele Suerz on 02/03/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

import UIKit

protocol ColorDelegate {
    func setButtonColor(buttonColor: UIColor)
}

class ColorViewController: UIViewController {
    
    var color: UIColor = UIColor.blue
    var delegate: ColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - Actions
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "Red":
            color = UIColor.red
        case "Green":
            color = UIColor.green
        case "Blue":
            color = UIColor.blue
        default:
            color = UIColor.black
        }
        
        self.delegate?.setButtonColor(buttonColor: color)
        
        _ = navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

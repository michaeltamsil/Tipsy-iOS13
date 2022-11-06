//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPtcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = Bool(sender == zeroPctButton)
        tenPctButton.isSelected = Bool(sender == tenPctButton)
        twentyPtcButton.isSelected = Bool(sender == twentyPtcButton)
        
        let title = sender.titleLabel?.text
        let value = (title as! NSString).floatValue / 100
        print(value)
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
    }
    @IBAction func calculatePressed(_ sender: Any) {
    }
}


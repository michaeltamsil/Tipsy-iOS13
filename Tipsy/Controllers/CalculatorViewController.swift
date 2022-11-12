//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class CalculatorViewController: UIViewController {
    
    var calculate = Calculate()

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
        _ = (title! as NSString).floatValue / 100
        billTextField.endEditing(true)
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format : "%.0f",sender.value)
        
    }
    @IBAction func calculatePressed(_ sender: Any) {
        if var bill = Float(billTextField.text!) {
            var percent: String = "0.0%"
            var tips :NSNumber? = 0
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.locale = Locale(identifier: "EN")
            if zeroPctButton.isSelected {
                percent = zeroPctButton.titleLabel!.text!
            } else if twentyPtcButton.isSelected {
                percent = twentyPtcButton.titleLabel!.text!
            } else if tenPctButton.isSelected {
                percent = tenPctButton.titleLabel!.text!
            }
            calculate.percent = percent
            tips = formatter.number(from: percent)
            
            if let tipsTmp = tips {
                bill = bill + (bill * Float(truncating: tipsTmp))
                let splits = Float(splitNumberLabel.text ?? "0.0")
                bill = bill / (splits ?? 0.0)
                calculate.bill = bill
                calculate.splits = splits!
            }
        }
                
        print(splitNumberLabel.text ?? "0")
    }
    @IBAction func showDetail(_ sender: Any) {
        self.performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let resultViewController = segue.destination as! ResultsViewController
            resultViewController.label = "\(String(describing: calculate.bill))"
            resultViewController.setting = "Split between \(String(describing: calculate.splits)) people, with \(calculate.percent) tip."
        }
    }
}


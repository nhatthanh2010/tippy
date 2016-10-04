//
//  ViewController.swift
//  tippy
//
//  Created by Will on 9/24/16.
//  Copyright © 2016 Will. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tranferData : UserDefaults!
    var symbol = "$"
    var tipPercentages = [0.18, 0.2, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        if(defaults.object(forKey: "newSymbol") != nil){
            symbol = defaults.object(forKey: "newSymbol") as! String
            tipLabel.text = symbol + "0.00"
            totalLabel.text = symbol + "0.00"
        }
        if(defaults.object(forKey: "newPercent") != nil){
            let percent = defaults.object(forKey: "newPercent") as! String
            let temppercent = "0." + percent
            let temp = Double(temppercent)
            print(temppercent)
            tipPercentages.append(temp!)
            tipControl.insertSegment(withTitle: percent+"%", at: tipPercentages.count + 1 , animated: true)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func tapAction(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func inputValue(_ sender: AnyObject) {
        let bill = Double(billField.text!)
        
        print(tipPercentages[tipControl.selectedSegmentIndex])
        
        let tip = bill! * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill!
        
        tipLabel.text = "\(symbol)\(tip)"
        totalLabel.text = "\(symbol)\(total)"
        
        
        
    }
    
    
    @IBAction func updateContent(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        if(defaults.object(forKey: "newSymbol") != nil){
            symbol = defaults.object(forKey: "newSymbol") as! String
            tipLabel.text = symbol + "0.00"
            totalLabel.text = symbol + "0.00"
        }
        if(defaults.object(forKey: "newPercent") != nil){
            let percent = defaults.object(forKey: "newPercent") as! String
            let temppercent = "0." + percent
            let temp = Double(temppercent)
            
            if(tipPercentages.contains(temp!) == false){
                tipPercentages.append(temp!)
                tipControl.insertSegment(withTitle: percent+"%", at: tipPercentages.count + 1 , animated: true)
            }
        }

    }
    
    

}


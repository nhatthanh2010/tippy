//
//  settingViewController.swift
//  tippy
//
//  Created by Will on 9/24/16.
//  Copyright © 2016 Will. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {
    
    
    @IBOutlet weak var txtSymbol: UITextField!
    @IBOutlet weak var txtPercentage: UITextField!
    @IBOutlet weak var lblSettingNoti: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblSettingNoti.text = " "
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitSetting(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        if(txtPercentage.text != ""){
            defaults.set(txtPercentage.text, forKey: "newPercent")
            defaults.synchronize()
            lblSettingNoti.text = "Update Successful!"
        }
        
        if(txtSymbol.text != ""){
            defaults.set(txtSymbol.text, forKey: "newSymbol")
            defaults.synchronize()
            lblSettingNoti.text = "Update Successful!"
        }
    }
    
    

}

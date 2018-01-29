//
//  ViewController.swift
//  tippy
//
//  Created by Honorio Vega on 1/22/18.
//  Copyright © 2018 Honorio Vega. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        
        // Access UserDefaults
        let defaults = UserDefaults.standard
        
        let intValue = defaults.integer(forKey: "defaultTipIndex")
        
        
        
        tipControl.selectedSegmentIndex = intValue
        
        // set the bill as first responder
        billField.becomeFirstResponder()


        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        // Access UserDefaults
        let defaults = UserDefaults.standard
        
        let intValue = defaults.integer(forKey: "defaultTipIndex")
        
        
        
        tipControl.selectedSegmentIndex = intValue
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
       // open the keyboard to enter the bill by default
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

    @IBAction func onTap(_ sender: Any) {
        
        // close keyboard
        view.endEditing(true)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let locale = Locale.current

        let currencySymbol = locale.currencySymbol!

        // "1,605,436" where Locale == en_US
        let formattedTip = String(format: "%.2f", locale: Locale.current, Double(bill))
        let formattedBill = String(format: "%.2f", locale: Locale.current, Double(total))
                tipLabel.text = currencySymbol + formattedTip
                totalLabel.text = currencySymbol + formattedBill
//        tipLabel.text = String.init(format: "$%.2f", tip)
//        totalLabel.text = String.init(format: "$%.2f", total)
    }
}


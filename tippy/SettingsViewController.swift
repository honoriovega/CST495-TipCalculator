//
//  SettingsViewController.swift
//  tippy
//
//  Created by Honorio Vega on 1/24/18.
//  Copyright © 2018 Honorio Vega. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var TipPercentageSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Access UserDefaults
        let defaults = UserDefaults.standard
        
        let intValue = defaults.integer(forKey: "defaultTipIndex")
        
        
        
        TipPercentageSegment.selectedSegmentIndex = intValue
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func updateDefaultTipPercentage(_ sender: Any) {
        
        print("clciked!")
        //Access UserDefaults
        let defaults = UserDefaults.standard
        
      
        // Set an Integer value for some key.
        defaults.set(TipPercentageSegment.selectedSegmentIndex, forKey: "defaultTipIndex")
        
        // Force UserDefaults to save.
        defaults.synchronize()
        
    }
}

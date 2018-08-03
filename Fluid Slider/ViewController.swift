//
//  ViewController.swift
//  Fluid Slider
//
//  Created by Warren Hansen on 8/2/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var mySlider: UISlider!
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var mySegmentedSwitch: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // segmented switch
        let lastSegment = defaults.integer(forKey: "segment")
        print("Last segment was \(lastSegment)")
        mySegmentedSwitch.selectedSegmentIndex = lastSegment
        // slider
        let lastSliderValue = defaults.float(forKey: "MaxDistance2")
        let mStr = String(format: "%.1f", lastSliderValue)
        print("Last slider value \(mStr)")
        mySlider.setValue(lastSliderValue, animated: true)
        myLabel.text = mStr
    }
    
    @IBAction func sliderValueDidChange(_ sender: UISlider) {
        let currentValue = sender.value
        let mStr = String(format: "%.1f", currentValue)
        print("New Slider Value \(mStr)")
        defaults.set(currentValue, forKey: "MaxDistance2")
        myLabel.text = mStr
    }
    
    @IBAction func switchDidChange(_ sender: AnyObject) {

        switch mySegmentedSwitch.selectedSegmentIndex {
        case 0:
            defaults.set(0, forKey: "segment")
            print("set \(0) and got back \(defaults.integer(forKey: "segment"))")
        case 1:
            defaults.set(1, forKey: "segment")
            print("set \(1) got back \(defaults.integer(forKey: "segment"))")
        case 2:
            defaults.set(2, forKey: "segment")
            print("set \(2) got back \(defaults.integer(forKey: "segment"))")
        case 3:
            defaults.set(3, forKey: "segment")
            print("set \(3) got back \(defaults.integer(forKey: "segment"))")
        default:
            print("nothing selected")
        }
    }
    
}


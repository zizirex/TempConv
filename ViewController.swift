//
//  ViewController.swift
//  Unit Converter
//
//  Created by Raditya Amandra Iskandar on 1/21/19.
//  Copyright © 2019 Raditya Amandra Iskandar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var temperatureRange: TemperatureRange!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperaturePicker: UIPickerView!
    
    @IBOutlet weak var segmentSwitch: UISegmentedControl!
    
    var testCall = true
    
    let unitConverter = UnitConverter()
    
    let userDefaultsLastRowKey = "defaultsCelciusPickerRow"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        temperaturePicker.delegate = self;
        let defaultPickerRow = initialPickerRow()
        
        temperaturePicker.selectRow(defaultPickerRow, inComponent: 0, animated: true)
        
    }

    
    @IBAction func segmentSwitchTapped(_ sender: Any) {
        let getConvert = segmentSwitch.selectedSegmentIndex
        print(getConvert)
        
        switch (getConvert) {
        case 0:
            print("Celsius")
            testCall = true
            temperaturePicker.reloadComponent(0)
            pickerView(temperaturePicker, didSelectRow: initialPickerRow(), inComponent: 0)
            break
        case 1:
            print("Fahrenheit")
            testCall = false
            temperaturePicker.reloadComponent(0)
            pickerView(temperaturePicker, didSelectRow: initialPickerRow(), inComponent: 0)
            break
        default:
            print("Not Selected")
        }
    }
    
    func initialPickerRow() -> Int{
        if let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int {
            return savedRow
        }
        return temperaturePicker.numberOfRows(inComponent: 0) / 2
    }
    func saveSelectedRow(row: Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey )
        defaults.synchronize()
    }
    
    func displayConvertedTemperatureForRow(row: Int){
        if testCall == true {
        let celciusValue = temperatureRange.values[row]
        temperatureLabel.text = "\(unitConverter.degreesFahrenheit(degreesCelcius: celciusValue))°F"
        }
        else {
        let fahrenheitValue = temperatureRange.values[row]
        temperatureLabel.text = "\(unitConverter.degreesCelcius(degreesFahrenheit: fahrenheitValue))°C"
            
        }
        
    }
    
}

extension ViewController: UIPickerViewDelegate {
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if testCall == true {
            return "\(temperatureRange.values[row])°C"
        }
        else {
            return "\(temperatureRange.values[row])°F"
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row: row)
        saveSelectedRow(row: row)
        }
    
}



//
//  TemperatureRange.swift
//  Unit Converter
//
//  Created by Raditya Amandra Iskandar on 1/21/19.
//  Copyright © 2019 Raditya Amandra Iskandar. All rights reserved.
//

import UIKit
import Foundation



class TemperatureRange: NSObject, UIPickerViewDataSource {
    
    let values = (-100...212).map { $0 }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
}

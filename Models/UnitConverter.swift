//
//  UnitConverter.swift
//  Unit Converter
//
//  Created by Raditya Amandra Iskandar on 1/21/19.
//  Copyright © 2019 Raditya Amandra Iskandar. All rights reserved.
//

import Foundation

class UnitConverter  {
    func degreesFahrenheit(degreesCelcius: Int) -> Int{
        return Int(1.8 * Float(degreesCelcius) + 32.0)
    }
    func degreesCelcius(degreesFahrenheit: Int) -> Int{
        return Int(0.55 * (Float(degreesFahrenheit) - 32.0))
    }
}

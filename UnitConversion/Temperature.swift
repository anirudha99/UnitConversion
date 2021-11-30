//
//  Temperature.swift
//  UnitConversion
//
//  Created by Anirudha SM on 13/10/21.
//

import Foundation

enum UnitTemperature: Int {
    case celsius, farenheit, kelvin
    
    func description() -> String {
        switch self {
        case .celsius:
            return "celsius"
        case .farenheit:
            return "farenheit"
        case .kelvin:
            return "kelvin"
        }
    }
    
    
    static func allCases() -> [String] {
        var i = 0
        var list = [String]()
        while let unittemp = UnitTemperature(rawValue: i) {
            list.append(unittemp.description())
            i = i + 1
        }
        return list
    }
    
    func convertTo(unittemp to: UnitTemperature, value val: Double) -> Double {
        var constant = 1.0
        switch self {
        case .celsius:
            if to == .farenheit {
                constant = 2.54
            } else if to == .kelvin {
                constant = 0.08333333
            }
            
        case .farenheit:
            if to == .celsius {
                constant = 0.0393701
            }
            else if to == .kelvin {
                constant = 0.01
            }
            
        case .kelvin:
            if to == .celsius {
                constant = 12;
            } else if to == .farenheit {
                constant = 30.48
            }
        }
        return constant * val
    }
    
    static func fromString(_ string: String) -> UnitTemperature? {
        if string == "celsius" {
            return .celsius
        } else if string == "kelvin" {
            return .kelvin
        } else if string == "farenheit" {
            return .farenheit
        } else{
            return nil
        }
    }
}

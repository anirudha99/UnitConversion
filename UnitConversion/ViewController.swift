//
//  ViewController.swift
//  UnitConversion
//
//  Created by Anirudha SM on 10/10/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let list = Unit.allCases()
//    let listtemp = UnitTemperature.allCases()
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UITextField!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func convertUnits(_ sender: UIButton) {
        let fromUnitIdx = picker.selectedRow(inComponent: 0)
        let toUnitIdx = picker.selectedRow(inComponent: 1)
        
       guard let fromUnit = Unit.fromString(list[fromUnitIdx])
        else {
            return
        }
//        let fromUnitTemp = UnitTemperature.fromString(listtemp[fromUnitIdx])! //temp
//        let toUnitTemp = UnitTemperature.fromString(listtemp[toUnitIdx])! //temp
        guard let toUnit = Unit.fromString(list[toUnitIdx]) else { return }
        
        if let inputText = input.text {
            if !inputText.isEmpty {
                guard let inputNum = Double(inputText) else {
                    
                    return }
                let outputNum = fromUnit.convertTo(unit: toUnit, value: inputNum)
                output.text = String(outputNum)
            }
        }
        //for temperature
//        if let inputText = input.text {
//            if !inputText.isEmpty {
//                let inputNum = Double(inputText)!
//                let outputNum = fromUnitTemp.convertTo(unittemp: toUnitTemp, value: inputNum)
//                output.text = String(outputNum)
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        picker.delegate = self
        picker.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return list.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
}


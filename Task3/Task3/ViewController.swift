//
//  ViewController.swift
//  Task3
//
//  Created by Dynamo Software on 21.04.20.
//  Copyright © 2020 Dynamo Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldSoup: UITextField!
    @IBOutlet weak var textFieldMainDishes: UITextField!
    @IBOutlet weak var textfieldDessert: UITextField!
    @IBOutlet weak var stepperMainDIsh: UIStepper!
    @IBOutlet weak var stepperDessert: UIStepper!
    @IBOutlet weak var stepperSoup: UIStepper!
    @IBOutlet weak var coekSlide: UISlider!
    @IBOutlet weak var deliveryToggle: UISwitch!
    @IBOutlet weak var priceLabel: UILabel!
    
    var multiplier: Double = 1
    var currencyLabel = "EUR"
    let exchangeRates = ["USD" : 1.1,
                         "EUR" : 1.0,
                         "BGN" : 1.95]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onMainDStepperValueChanged(_ sender: Any) {
        textFieldMainDishes.text = String(Int(stepperMainDIsh.value))
    }
    
    @IBAction func onDessertChange(_ sender: Any) {
        textfieldDessert.text = String(Int(stepperDessert.value))
    }
    
    @IBAction func onSoupStepperValueChanged(_ sender: Any) {
        textFieldSoup.text = String(Int(stepperSoup.value))
    }
    
    @IBAction func onDesertTextChange(_ sender: UITextField) {
        guard let value = Int(sender.text ?? "no data"), value < 10, value > 0 else {
            sender.text = ""
            return
        }
        
        stepperDessert.value = Double(value)
    }
    
    @IBAction func onMainTextChange(_ sender: UITextField) {
        guard let value = Int(sender.text ?? "no data"), value < 10, value > 0 else {
            sender.text = ""
            return
        }
        
        stepperMainDIsh.value = Double(value)
    }
    
    @IBAction func onSoupTextChange(_ sender: UITextField) {
        guard let value = Int(sender.text ?? "no data"), value < 10, value > 0 else {
            sender.text = ""
            return
        }
        
        stepperSoup.value = Double(value)
    }
    
    @IBAction func onCurrencyChange(_ sender: UIButton){
        currencyLabel = sender.titleLabel?.text ?? "EUR"
        multiplier = exchangeRates[currencyLabel] ?? 1.0
        calculateTotalLabel()
    }
    
    @IBAction func calculateTotal(_ sender: Any) {
        calculateTotalLabel()
    }
    
    @IBAction func MainDishChange(_ sender: Any) {
            textFieldMainDishes.text = String(Int(stepperMainDIsh.value))
    }
    
    func calculateTotalLabel(){
        let soupPrice = 2 * stepperSoup.value
        let mainPrice = 4.5 * stepperMainDIsh.value
        let dessertPrice = 1.5 * stepperDessert.value
        let cokePrice = Double(2 * coekSlide.value)
        let delivery = deliveryToggle.isOn ? 10.0 : 0.0
        
        let total = (soupPrice + mainPrice + dessertPrice + cokePrice + delivery) * multiplier
        priceLabel.text = String(format: "%.2f \(currencyLabel)", total)
    }
}


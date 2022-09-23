//
//  ViewController.swift
//  AlcoolxGasolina
//
//  Created by Igor Fernandes on 23/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var alcoholTextField: UITextField!
    @IBOutlet weak var gasTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var resultsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // dividir o preço do litro do álcool pelo da gasolina.
    func getValues() {
        var difference: Double = 0
        // unwrap optional text values AND convert to float
        if let alcohol = alcoholTextField.text, let gas = gasTextField.text {
            guard let alcoholPrice = Double(alcohol) else { return }
            guard let gasPrice = Double(gas) else { return }
            
            difference = alcoholPrice / gasPrice
        }
        
        if difference > 0.7 {
            let priceToPercent = difference * 100
            let priceFormatted = String(format: "%.2f", priceToPercent)
            print("compre gasolina. a diferença é de \(priceFormatted)%")
        } else {
            let priceToPercent = difference * 100
            let priceFormatted = String(format: "%.2f", priceToPercent)
            print("compre álcool. a diferença é de \(priceFormatted)%")
        }
    }
    
    @IBAction func tappedCalculate(_ sender: UIButton) {
        getValues()
    }
}


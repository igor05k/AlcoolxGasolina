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
    
    // difference between alcohol v gas
    private var difference: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // divide alcohol price by gas price and multiply by 7.
    func getValues() {
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
    
    // MARK: Create elements
    let resultLabelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.text = "Resultados"
        return label
    }()
    
    
    // MARK: Set elements constraints
    private func showLabel() {
        resultsView.addSubview(resultLabelText)
        
        NSLayoutConstraint.activate([
            resultLabelText.topAnchor.constraint(equalTo: resultsView.topAnchor),
            resultLabelText.leftAnchor.constraint(equalTo: resultsView.leftAnchor, constant: 10),
            resultLabelText.rightAnchor.constraint(equalTo: resultsView.rightAnchor, constant: 10),
        ])
    }
    
    // MARK: Button actions
    @IBAction func tappedCalculate(_ sender: UIButton) {
        getValues()
        showLabel()
    }
}


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
            
            // make gas price and percent text bold
            let attributedDescription = NSMutableAttributedString(string: "Você deveria comprar gasolina pois a diferença é de \(priceFormatted)%")
            attributedDescription.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)], range: NSRange(location: 21, length: 8))
            attributedDescription.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)], range: NSRange(location: 52, length: 6))
            
            descriptionText.attributedText = attributedDescription

        } else {
            let priceToPercent = difference * 100
            let priceFormatted = String(format: "%.2f", priceToPercent)
            
            // make alcohol price and percent text bold
            let attributedDescription = NSMutableAttributedString(string: "Você deveria comprar álcool pois a diferença é de \(priceFormatted)%")
            attributedDescription.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)], range: NSRange(location: 21, length: 6))
            attributedDescription.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)], range: NSRange(location: 50, length: 6))
            
            descriptionText.attributedText = attributedDescription
        }
    }
    
    // MARK: Create elements
    let resultLabelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.text = "Resultado:"
        return label
    }()
    
    let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Resetar Valores", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    
    // MARK: Set elements constraints
    private func showResultLabel() {
        resultsView.addSubview(resultLabelText)
        
        NSLayoutConstraint.activate([
            resultLabelText.topAnchor.constraint(equalTo: resultsView.topAnchor),
            resultLabelText.leftAnchor.constraint(equalTo: resultsView.leftAnchor, constant: 10),
            resultLabelText.rightAnchor.constraint(equalTo: resultsView.rightAnchor, constant: 10),
        ])
    }
    
    private func showDescriptionLabel() {
        resultsView.addSubview(descriptionText)
        
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: resultLabelText.bottomAnchor, constant: 15),
            descriptionText.leftAnchor.constraint(equalTo: resultLabelText.leftAnchor),
            descriptionText.rightAnchor.constraint(equalTo: resultLabelText.rightAnchor),
        ])
    }
    
    private func showResetButton() {
        resultsView.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(tappedReset(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 25),
            resetButton.leftAnchor.constraint(equalTo: descriptionText.leftAnchor),
            resetButton.rightAnchor.constraint(equalTo: descriptionText.rightAnchor, constant: -10),
            resetButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // MARK: Button actions
    @IBAction func tappedCalculate(_ sender: UIButton) {
        getValues()
        showResultLabel()
        showDescriptionLabel()
        showResetButton()
    }
    
    @objc private func tappedReset(_ sender: UIButton) {
        resultsView.removeFromSuperview()
        alcoholTextField.text = String()
        gasTextField.text = String()
    }
}


//
//  ViewController.swift
//  AlcoolxGasolina
//
//  Created by Igor Fernandes on 23/09/22.
//

import UIKit
// TODO: REMOVE COPY AND PASTE
class ViewController: UIViewController {
    
    @IBOutlet weak var alcoholTextField: CustomTextFields!
    @IBOutlet weak var gasTextField: CustomTextFields!
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var resultsView: UIView!
    
    // difference between alcohol v gas
    private var difference: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCalculateButton()
        configKeyboard()
    }
    
    // config keyboard
    func configKeyboard() {
        gasTextField.keyboardType = .decimalPad
        alcoholTextField.keyboardType = .decimalPad
    }
    
    // divide alcohol price by gas price and multiply by 7.
    func getValues() {
        // unwrap optional text values AND convert to float
        if let alcohol = alcoholTextField.text?.replacingOccurrences(of: ",", with: "."),
           let gas = gasTextField.text?.replacingOccurrences(of: ",", with: ".") {
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
        button.setTitle("Resetar Valores".uppercased(), for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: Button actions
    @IBAction func tappedCalculate(_ sender: UIButton) {
        guard let alcoholText = alcoholTextField.text else { return }
        guard let gasText = gasTextField.text else { return }
        
        if !alcoholText.isEmpty && !gasText.isEmpty {
            getValues()
            showResultLabel()
            showDescriptionLabel()
            showResetButton()
        } else {
            let alert = UIAlertController(title: "Atenção", message: "Você tem que preencher todos os campos.", preferredStyle: .alert)
            let actionConfirm = UIAlertAction(title: "OK", style: .default)
            alert.addAction(actionConfirm)
            present(alert, animated: true)
        }
        self.view.endEditing(true)
    }
    
    private func removeElementsFromSuperView() {
        resultLabelText.removeFromSuperview()
        descriptionText.removeFromSuperview()
        resetButton.removeFromSuperview()
    }
    
    @objc func tappedReset(_ sender: UIButton) {
        let alert = UIAlertController(title: "Atenção", message: "Tem certeza que deseja resetar os valores?", preferredStyle: .alert)
        
        let actionConfirm = UIAlertAction(title: "OK", style: .destructive) { alert in
            self.removeElementsFromSuperView()
            self.alcoholTextField.text = ""
            self.gasTextField.text = ""
        }
        
        let actionCancel = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alert.addAction(actionConfirm)
        alert.addAction(actionCancel)
        present(alert, animated: true)
    }
}

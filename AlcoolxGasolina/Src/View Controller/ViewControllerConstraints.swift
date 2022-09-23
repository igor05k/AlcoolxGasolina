//
//  ViewControllerConstraints.swift
//  AlcoolxGasolina
//
//  Created by Igor Fernandes on 23/09/22.
//

import UIKit

extension ViewController {
    // MARK: Set elements constraints
    func showResultLabel() {
        resultsView.addSubview(resultLabelText)
        
        NSLayoutConstraint.activate([
            resultLabelText.topAnchor.constraint(equalTo: resultsView.topAnchor),
            resultLabelText.leftAnchor.constraint(equalTo: resultsView.leftAnchor, constant: 10),
            resultLabelText.rightAnchor.constraint(equalTo: resultsView.rightAnchor, constant: 10),
        ])
    }
    
    func showDescriptionLabel() {
        resultsView.addSubview(descriptionText)
        
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: resultLabelText.bottomAnchor, constant: 15),
            descriptionText.leftAnchor.constraint(equalTo: resultLabelText.leftAnchor),
            descriptionText.rightAnchor.constraint(equalTo: resultLabelText.rightAnchor),
        ])
    }
    
    func showResetButton() {
        resultsView.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(tappedReset(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 25),
            resetButton.leftAnchor.constraint(equalTo: descriptionText.leftAnchor),
            resetButton.rightAnchor.constraint(equalTo: descriptionText.rightAnchor, constant: -10),
            resetButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configCalculateButton() {
        calculateButton.layer.borderWidth = 1
        calculateButton.layer.borderColor = UIColor.white.cgColor
        calculateButton.layer.cornerRadius = 10
    }
}

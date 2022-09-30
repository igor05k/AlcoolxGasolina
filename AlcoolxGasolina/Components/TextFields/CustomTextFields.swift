//
//  CustomTextFields.swift
//  AlcoolxGasolina
//
//  Created by Igor Fernandes on 29/09/22.
//

import UIKit

class CustomTextFields: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}

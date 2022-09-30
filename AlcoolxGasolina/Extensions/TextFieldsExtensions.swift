import UIKit

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // MARK: Mask
        var appendString: String = ""
        
        if range.length == 0 {
            switch range.location {
            case 1:
                appendString = ","
            default:
                break
            }
        }
        textField.text?.append(appendString)
        
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.text = String(textField.text!.prefix(5))
    }
}

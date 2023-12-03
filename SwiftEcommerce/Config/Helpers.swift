import SwiftUI
import Foundation

func showAlert(title: String, message: String) {
    let alertBox = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertBox.addAction(okAction)
    if let view = UIApplication.shared.keyWindow?.rootViewController {
        view.present(alertBox, animated: true)
    }
}

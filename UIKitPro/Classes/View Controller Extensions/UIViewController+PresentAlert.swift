//
//  UIViewController+PresentAlert.swift
//  UIKitPro
//
//  Created by Lucas Best on 12/8/17.
//

import UIKit

public extension UIViewController {
    func presentAlert(title: String?, message: String?, actions: [UIAlertAction] = []) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        for action in actions {
            alertController.addAction(action)
        }

        if actions.count == 0 {
            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okAction)
        }

        self.present(alertController, animated: true)
    }
}

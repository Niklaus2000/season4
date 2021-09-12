//
//  UIVIewController+Extensions.swift
//  4Season
//
//  Created by Nika on 10.06.21.
//

import UIKit

extension UIViewController {
    func showAlert(alertText : String, alertMessage : String, title: String) {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "დახუვა", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


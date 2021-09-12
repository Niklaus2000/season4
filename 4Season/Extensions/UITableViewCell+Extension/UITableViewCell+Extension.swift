//
//  UITableViewCell+Extension.swift
//  4Season
//
//  Created by Nika on 23.07.21.
//

import Foundation
import UIKit

extension UITableViewCell {

    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: identifier, bundle: Bundle.main) }
}

//
//  LikeAnimator.swift
//  4Season
//
//  Created by Nika on 13.06.21.
//

import UIKit

class LikeAnimator {
    
    // MARK: - Private Variables
    private let container: UIView
    private let layoutConstraint: NSLayoutConstraint
    
    // MARK: - Initialize
    init(container: UIView, layoutConstraint: NSLayoutConstraint) {
        self.container = container
        self.layoutConstraint = layoutConstraint
    }
    
    // MARK: - Methods
    func animate(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 2,
                       options: .curveLinear,
                       animations: { [weak self] in
                        
                        self?.container.layoutIfNeeded()
                        
                        
        }) { [weak self] _ in
            self?.layoutConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self?.container.layoutIfNeeded()
                completion()
            })
        }
    }
}


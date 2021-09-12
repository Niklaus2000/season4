//
//  WinterCollectionViewCell.swift
//  4Season
//
//  Created by Nika on 12.06.21.
//

import UIKit

class WinterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var winterimageView: UIImageView!
    @IBOutlet weak var isLikedImageView: UIImageView!
    @IBOutlet weak var likeImageViewWidthConstraint: NSLayoutConstraint!
    
    // MARK: - Private variables
    private var isLickedImage: Bool = false
    
    lazy var likeAnimator = LikeAnimator(container: contentView, layoutConstraint: likeImageViewWidthConstraint)
    lazy var doubleTapRecognizer: UITapGestureRecognizer = {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
        tapRecognizer.numberOfTapsRequired = 2
        return tapRecognizer
    }()
    
    // MARK: - View life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
            winterimageView.addGestureRecognizer(doubleTapRecognizer)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        winterimageView.image = nil
    }
    
    // MARK: - Methods
    private func populate(with photo: UIImage?) {
        winterimageView.image = photo
    }
    
    // MARK: - action
    @objc func didDoubleTap() {
        if !isLickedImage {
            likeAnimator.animate { [weak self] in
                self?.isLikedImageView.isHidden = false
                self?.isLickedImage = true
            }
        } else {
            likeAnimator.animate { [weak self] in
                self?.isLikedImageView.isHidden = true
                self?.isLickedImage = false
            }
        }
    }
}

//
//  AutmunCollectionViewCell.swift
//  4Season
//
//  Created by Nika on 12.06.21.
//

import UIKit

class AutmunCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var likeImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var autmunimageView: UIImageView!
    @IBOutlet weak var islikeImage: UIImageView!
    
    // MARK: - Private variables
    private var isLickedImage: Bool = false
    
    lazy var likeAnimator = LikeAnimator(container: contentView, layoutConstraint: likeImageViewWidthConstraint)
    lazy var doubleTapRecognizer: UITapGestureRecognizer = {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
        tapRecognizer.numberOfTapsRequired = 2
        return tapRecognizer
    }()
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
            autmunimageView.addGestureRecognizer(doubleTapRecognizer)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        autmunimageView.image = nil
    }
    
    // MARK: - Methods
    private func populate(with photo: UIImage?) {
        autmunimageView.image = photo
    }
    
    // MARK: - Action
    @objc func didDoubleTap() {
        if !isLickedImage {
            likeAnimator.animate { [weak self] in
                self?.islikeImage.isHidden = false
                self?.isLickedImage = true
            }
        } else {
            likeAnimator.animate { [weak self] in
                self?.islikeImage.isHidden = true
                self?.isLickedImage = false
            }
        }
    }
}



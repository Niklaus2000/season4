//
//  WinterViewController.swift
//  4Season
//
//  Created by Nika on 12.06.21.
//

import UIKit

class WinterViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}
 // MARK: - WinterViewController collectionView Extension
extension WinterViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return LocalConstants.imageUrls.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocalConstants.winterCollectionViewCellIdentifier, for: indexPath) as! WinterCollectionViewCell
        cell.winterimageView.kf.setImage(with: URL(string: LocalConstants.imageUrls[indexPath.row]))
        return cell
    }
}

// MARK: - WinterViewController UICollectionViewDelegateFlowLayout
extension WinterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let wh: CGFloat = collectionView.bounds.width / 2
        return CGSize(width: wh, height: wh)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

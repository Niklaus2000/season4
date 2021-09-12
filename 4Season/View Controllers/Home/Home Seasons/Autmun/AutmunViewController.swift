//
//  AutmunViewController.swift
//  4Season
//
//  Created by Nika on 12.06.21.
//

import UIKit

class AutmunViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    var imageUrls = [
       "https://i.imgur.com/af8ozue.jpeg",
       "https://andybeckimages.co.uk/wp-content/uploads/2021/02/Bowes-Museum-2.jpg",
       "https://www.explo-re.com/wp-content/uploads/2017/09/Italy-Autumn.jpg",
       "https://www.exploregeorgia.org/sites/default/files/2019-07/blue-ridge-fall-colors-brian-poole-wde_94.jpg",
       "https://i0.wp.com/thegoodlifefrance.com/wp-content/uploads/2013/10/chateau-in-autumn-annecy.jpg?ssl=1",
       "https://www.casas.co.uk/imagelibrary/rioja%20alavesa%20autumn%20600x400.jpg",
       "https://teamjapanese.com/wp-content/uploads/2017/09/kiyomizudera-temple-kyoto-autumn-in-japan.jpg"
       
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self

        
    }
}
extension AutmunViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return imageUrls.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AutmunCollectionViewCell", for: indexPath) as! AutmunCollectionViewCell
        cell.autmunimageView.kf.setImage(with: URL(string: imageUrls[indexPath.row]))
        return cell
    }
}
extension AutmunViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let wh: CGFloat = collectionView.bounds.width / 2 
        return CGSize(width: wh, height: wh)
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}


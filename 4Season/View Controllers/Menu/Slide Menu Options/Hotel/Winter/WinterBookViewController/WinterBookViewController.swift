//
//  WinterBookViewController.swift
//  4Season
//
//  Created by Nika on 28.07.21.
//

import UIKit
import MapKit
import CoreLocation
import MessageUI

class WinterBookViewController: UIViewController, MKMapViewDelegate, MFMailComposeViewControllerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var winterhotelnameLAbel: UILabel!
    @IBOutlet private weak var winterlocationLabel: UILabel!
    @IBOutlet private weak var winterpriceLabel: UILabel!
    @IBOutlet private weak var mapView: MKMapView!
    
    
    //MARK: - Variable
    var imagesArr = [String]()
    var latitude: Double = 0
    var longitude: Double = 0

    var hotelname = ""
    var hotelloacation = ""
    var hotelprice = ""

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    
    @IBAction func didwinterbook(_ sender: UIButton) {
        showMail()
    }
    
    private func setUpUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        mapView.delegate = self
        
        
        winterhotelnameLAbel.text = hotelname
        winterpriceLabel.text = hotelprice
        winterlocationLabel.text = hotelloacation
        collectionView.register(WinterHotelCollectionViewCell.self, forCellWithReuseIdentifier: "CHALLENGECELL")
        
        let coordinaters = CLLocationCoordinate2D(latitude: self.latitude,
                                                  longitude: self.longitude)
        let region = MKCoordinateRegion(center: coordinaters , latitudinalMeters: 750.0, longitudinalMeters: 750.0)
                mapView.setRegion(region, animated: true)
    }
    
    private func showMail() {
         
         guard MFMailComposeViewController.canSendMail() else {
             return
         }

         let composer = MFMailComposeViewController()
         composer.mailComposeDelegate = self
         composer.setToRecipients(["niklausgogichashvili@gmail.com"])
         composer.setSubject("სასტუმროში ვიზიტი")
         composer.setMessageBody("მსურს დავჯავშნო სასტუმრო, გთხოვთ დამიკავშირდეთ და შევათანხმოთ ვიზიტის დრო ", isHTML: false)
         
         present(composer, animated: true)
     }
    

}
// MARK: - collectionView extension
extension WinterBookViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return imagesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WinterHotelCollectionViewCell", for: indexPath) as! WinterHotelCollectionViewCell

        let image = imagesArr[indexPath.row]
        
        cell.imageView.kf.setImage(with: URL(string: image))
        
        return cell
    }

}


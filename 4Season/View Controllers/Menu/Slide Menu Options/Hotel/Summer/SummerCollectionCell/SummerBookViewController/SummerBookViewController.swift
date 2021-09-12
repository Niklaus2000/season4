//
//  SummerBookViewController.swift
//  4Season
//
//  Created by Nika on 25.07.21.
//

import UIKit
import CoreLocation
import MapKit
import MessageUI

class SummerBookViewController: UIViewController, MKMapViewDelegate, MFMailComposeViewControllerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var summerhotelnameLAbel: UILabel!
    @IBOutlet private weak var summerlocationLabel: UILabel!
    @IBOutlet private weak var summerpriceLabel: UILabel!
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: - Variables
    var imagesArr = [String]()
    var latitude: Double = 0
    var longitude: Double = 0
    
    var hotelname = ""
    var hotelloacation = ""
    var hotelprice = ""
    
    // MARK - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        
    }
    
    // MARK: - Methods
    private func setUpUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        mapView.delegate = self
        
        summerhotelnameLAbel.text = hotelname
        summerpriceLabel.text = hotelprice
        summerlocationLabel.text = hotelloacation
        collectionView.register(SummerHotelCollectionViewCell.self, forCellWithReuseIdentifier: "CHALLENGECELL")
        
        
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
    
    // MARK: - IBActions
    @IBAction func summerBookButton(_ sender: UIButton) {
        showMail()
    }
}

extension SummerBookViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return imagesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SummerHotelCollectionViewCell", for: indexPath) as! SummerHotelCollectionViewCell
        
        let image = imagesArr[indexPath.row]
        
        cell.imageView.kf.setImage(with: URL(string: image))
        
        
        return cell
    }
}

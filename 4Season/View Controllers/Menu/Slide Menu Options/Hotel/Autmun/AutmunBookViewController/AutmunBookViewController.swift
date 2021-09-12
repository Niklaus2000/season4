//
//  AutmunBookViewController.swift
//  4Season
//
//  Created by Nika on 28.07.21.
//

import UIKit
import CoreLocation
import MapKit
import MessageUI

class AutmunBookViewController: UIViewController, MKMapViewDelegate, MFMailComposeViewControllerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var autmungnameLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var autmunlocationsLabel: UILabel!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var autmunpriceLabel: UILabel!
    
    // MARK: - Variables
    var imagesArr = [String]()
    var latitude: Double = 0
    var longitude: Double = 0
    
    var hotelname = ""
    var hotelloacation = ""
    var hotelprice = ""
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    private func setUpUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        mapView.delegate = self
        
        
        
        autmungnameLabel.text = hotelname
        autmunpriceLabel.text = hotelprice
        autmunlocationsLabel.text = hotelloacation
        collectionView.register(AutmunHotelCollectionViewCell.self, forCellWithReuseIdentifier: "CHALLENGECELL")
        
        let coordinaters = CLLocationCoordinate2D(latitude: self.latitude,
                                                  longitude: self.longitude)
        let region = MKCoordinateRegion(center: coordinaters , latitudinalMeters: 750.0, longitudinalMeters: 750.0)
        mapView.setRegion(region, animated: true)
        
        
    }
    
    // MARK - Methods
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
    @IBAction func didBookButton(_ sender: UIButton) {
        showMail()
    }
}

// MARK: - collectionView extension
extension AutmunBookViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return imagesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AutmunHotelCollectionViewCell", for: indexPath) as! AutmunHotelCollectionViewCell
        
        let image = imagesArr[indexPath.row]
        
        cell.imageView.kf.setImage(with: URL(string: image))
        
        
        return cell
    }
}

//
//  SpringBookViewController.swift
//  4Season
//
//  Created by Nika on 26.07.21.
//

import UIKit
import CoreLocation
import MapKit
import MessageUI

class SpringBookViewController: UIViewController, MKMapViewDelegate, MFMailComposeViewControllerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var springnameLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var springlocationsLabel: UILabel!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var springpriceLabel: UILabel!
    
    // MARK: - variables
    var hotelname = ""
    var hotelloacation = ""
    var hotelprice = ""
    var imagesArr = [String]()
    var latitude: Double = 0
    var longitude: Double = 0
  
    // MARK: - View Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    // MARK: - Methods
    private func setUpUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        mapView.delegate = self
        
        springlocationsLabel.text = hotelloacation
        springnameLabel.text = hotelname
        springpriceLabel.text = hotelprice
        collectionView.register(SpringHotelCollectionViewCell.self, forCellWithReuseIdentifier: "CHALLENGECELLs")
        
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
    @IBAction func didbookButton(_ sender: UIButton) {
        self.showMail()
    }
    
}

// MARK: - collectionView extension
extension SpringBookViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return imagesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpringHotelCollectionViewCell", for: indexPath) as!
        SpringHotelCollectionViewCell

        let image = imagesArr[indexPath.row]
        
        cell.springImageView.kf.setImage(with: URL(string: image))
        
        
        return cell
    }
}



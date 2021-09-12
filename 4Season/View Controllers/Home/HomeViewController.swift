//
//  HomeViewController.swift
//  4Season
//
//  Created by Nika on 06.06.21.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var springgifImageView: UIImageView!
    @IBOutlet private weak var summergifImageView: UIImageView!
    @IBOutlet private weak var autmungifImageView: UIImageView!
    @IBOutlet private weak var wintergifImageView: UIImageView!
    
    // MARK: - Private variables
    private let transiton = SlideInTransition()
    private var sideMenuOpen = false

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTapGesture()
        viewConfiguration()
    }
    
    // MARK: - IBActions
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "MenuViewController", bundle: nil)
        let menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuViewController.delegate = self
        menuViewController.modalPresentationStyle = .overCurrentContext
        present(menuViewController, animated: true)
    }
    
    // MARK: - Methods
    private func configureTapGesture() {
        springgifImageView.addGestureRecognizer(springtViewGestureRecognizer())
        springgifImageView.isUserInteractionEnabled = true
        
        summergifImageView.addGestureRecognizer(summerViewGestureRecognizer())
        summergifImageView.isUserInteractionEnabled = true
        
        autmungifImageView.addGestureRecognizer(autmnViewGestureRecoginzer())
        autmungifImageView.isUserInteractionEnabled = true
        
        wintergifImageView.addGestureRecognizer(winterViewGestureRecoginzer())
        wintergifImageView.isUserInteractionEnabled = true
    }
    
    private func viewConfiguration() {
        self.springgifImageView.image = UIImage.gif(name: "spring")
        self.summergifImageView.image = UIImage.gif(name: "summer")
        self.autmungifImageView.image = UIImage.gif(name: "autmun")
        self.wintergifImageView.image = UIImage.gif(name: "winter")
    }
    
    private func springtViewGestureRecognizer() -> UITapGestureRecognizer {
        var recognizer = UITapGestureRecognizer()
        recognizer = UITapGestureRecognizer(target: self, action: #selector(self.springViewDidTap(_:)))
        return recognizer
    }
    
    private func summerViewGestureRecognizer() -> UITapGestureRecognizer {
        var recognizer = UITapGestureRecognizer()
        recognizer = UITapGestureRecognizer(target: self, action: #selector(self.summerViewDidTap(_:)))
        return recognizer
    }
    
    private func autmnViewGestureRecoginzer() -> UITapGestureRecognizer {
        var recognizer = UITapGestureRecognizer()
        recognizer = UITapGestureRecognizer(target: self, action: #selector(self.autumnViewDidTap(_:)))
        return recognizer
    }
    
    private func winterViewGestureRecoginzer() -> UITapGestureRecognizer {
        var recognizer = UITapGestureRecognizer()
        recognizer = UITapGestureRecognizer(target: self, action: #selector(self.winterViewDidTap(_:)))
        return recognizer
    }
    
}

// MARK: - HomeViewControllerExtension
extension HomeViewController {
    @objc private func springViewDidTap(_ gesture: UITapGestureRecognizer) {
        let storyboardspring = UIStoryboard(name: "SpringViewController", bundle: nil)
        let vc = storyboardspring.instantiateViewController(withIdentifier: "SpringViewController") as! SpringViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func summerViewDidTap(_ gesture: UITapGestureRecognizer) {
        let storyboardsummer = UIStoryboard(name: "SummerViewController", bundle: nil)
        let vc1 = storyboardsummer.instantiateViewController(withIdentifier: "SummerViewController") as! SummerViewController
        self.navigationController?.pushViewController(vc1, animated: true)
    }
    
    @objc private func autumnViewDidTap(_ gesture: UITapGestureRecognizer) {
        let storyboardautmun = UIStoryboard(name: "AutmunViewController", bundle: nil)
        let vc2 = storyboardautmun.instantiateViewController(withIdentifier: "AutmunViewController") as! AutmunViewController
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    @objc private func winterViewDidTap(_ gesture: UITapGestureRecognizer) {
        let stroryboardwinter = UIStoryboard(name: "WinterViewController", bundle: nil)
        let vc3 = stroryboardwinter.instantiateViewController(withIdentifier: "WinterViewController") as! WinterViewController
        self.navigationController?.pushViewController(vc3, animated: true)
    }
    
}

extension HomeViewController {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}

extension HomeViewController: MenuViewControllerDelegate {
    
    func didClickOnAboutUs() {
        let storyboard = UIStoryboard(name: "AboutViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func didClickOnHotel() {
        let storyboard = UIStoryboard(name: "HotelViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HotelViewController") as! HotelViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didClickOnTax() {
        let storyboard = UIStoryboard(name: "TaxViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TaxViewController") as! TaxViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didClickOnWeather() {
        let storyboard = UIStoryboard(name: "WeatherViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func didClickOnFly() {
        let storyboard = UIStoryboard(name: "FlyTicketViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FlyTicketViewController") as! FlyTicketViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func didClickOnCamera() {
        let storyboard = UIStoryboard(name: "CameraViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func didClickOnMemories() {
        let storyboard = UIStoryboard(name: "MemoriesViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MemoriesViewController") as! MemoriesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func didClickOnSettings() {
        let storyboard = UIStoryboard(name: "SettingsViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func didClickOnSignOut() {
        let storyboard = UIStoryboard(name: "LogInViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



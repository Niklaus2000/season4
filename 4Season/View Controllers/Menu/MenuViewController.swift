//
//  MenuViewController.swift
//  4Season
//
//  Created by Nika on 11.06.21.
//

import UIKit

protocol MenuViewControllerDelegate {
    func didClickOnAboutUs()
    func didClickOnHotel()
    func didClickOnTax()
    func didClickOnWeather()
    func didClickOnFly()
    func didClickOnCamera()
    func didClickOnMemories()
    func didClickOnSettings()
    func didClickOnSignOut()
}

enum MenuType: Int {
    case aboutus
    case hotel
    case weather
    case tax
    case fly
    case camera
    case memory
    case settigs
    case signout
}

class MenuViewController: UITableViewController,UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var delegate: MenuViewControllerDelegate?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        if menuType == .aboutus { // 0
            self.dismiss(animated: true) { [weak self] in
                self?.delegate?.didClickOnAboutUs()
            }
        } else if menuType == .hotel { // 1
            self.dismiss(animated: true) { [weak self] in
                self?.delegate?.didClickOnHotel()
            }
        } else if menuType == .weather { // 2
            self.dismiss(animated: true) { [weak self] in
                self?.delegate?.didClickOnWeather()
            }
        } else if menuType == .tax { // 3
            self.dismiss(animated: true) { [weak self] in
                self?.delegate?.didClickOnTax()
            }
            
        }
        else if menuType == .fly { // 4
            self.dismiss(animated: true) { [weak self] in
                self?.delegate?.didClickOnFly()
            }
        } else if menuType == .camera {
            self.dismiss(animated: true) { [weak self] in
                self?.delegate?.didClickOnCamera()
            }
        }else if menuType == .memory {
            self.dismiss(animated: true) { [weak self] in
                self?.delegate?.didClickOnMemories()
            }
        }else if menuType == .settigs {
            self.dismiss(animated: true) { [weak self] in
                self?.delegate?.didClickOnSettings()
            }
        }else if menuType == .signout {
            self.dismiss(animated: true) { [weak self] in
                self?.delegate?.didClickOnSignOut()
            }
        }
    }
    @IBAction func didbaritem(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeViewController.modalPresentationStyle = .overCurrentContext
        homeViewController.transitioningDelegate = self
        present(homeViewController, animated: true)
        
    }
    
}

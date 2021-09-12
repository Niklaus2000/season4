//
//  ViewController.swift
//  4Season
//
//  Created by Nika on 06.06.21.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var animationView: AnimationView!
    
    // MARK: - View Lice Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setUpUI() {
        let checkMarkAnimation =  AnimationView(name: "travelAnimation")
        animationView.contentMode = .scaleAspectFit
        animationView.addSubview(checkMarkAnimation)
        checkMarkAnimation.frame = animationView.bounds
        checkMarkAnimation.loopMode = .autoReverse
        checkMarkAnimation.play()
    }
    
    // MARK: - IBactions
    @IBAction func signUpDidTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: LocalConstats.signInViewControllerIdentifier,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: LocalConstats.signInViewControllerIdentifier) as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func logInDidTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: LocalConstats.logInViewControllerIdentifier,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: LocalConstats.logInViewControllerIdentifier) as! LogInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


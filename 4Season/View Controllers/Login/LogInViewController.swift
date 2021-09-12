//
//  LogInViewController.swift
//  4Season
//
//  Created by Nika on 06.06.21.
//

import UIKit
import FirebaseAuth
import Lottie

class LogInViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var separatorViewForEmail: UIView!
    @IBOutlet private weak var separatorViewForPassword: UIView!
    @IBOutlet private weak var successAnimationView: AnimationView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Methods
    private func setUpUI() {
        passwordTextField.isSecureTextEntry = true
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        emailTextField.delegate = self
        passwordTextField.delegate = self
        self.successAnimationView.isHidden = true
    }
    
    private func startLogoOneAnimation() {
        self.successAnimationView.isHidden = false
        let checkMarkAnimation =  AnimationView(name: LocalConstants.loginSuccessAnimation)
        successAnimationView.contentMode = .scaleAspectFit
        successAnimationView.addSubview(checkMarkAnimation)
        checkMarkAnimation.frame = successAnimationView.bounds
        checkMarkAnimation.loopMode = .loop
        checkMarkAnimation.play()
        checkMarkAnimation.animationSpeed = 2.0
    }
    
    // MARK - IBActions
    @IBAction func logInDidTap(_ sender: UIButton) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if email.isEmpty == true {
            self.showAlert(alertText: LocalConstants.alertErrorText, alertMessage: LocalConstants.alertErrorMessageEmail,
                           title: LocalConstants.emtyText)
        } else if password.isEmpty == true {
            self.showAlert(alertText: LocalConstants.alertErrorText, alertMessage: LocalConstants.alertErrorMessagePassword, title: LocalConstants.emtyText)
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error)  in
                if error != nil {
                    self.showAlert(alertText: LocalConstants.alertErrorText,
                                   alertMessage: error?.localizedDescription ?? LocalConstants.alertErrorTextTryAgain,
                                   title: LocalConstants.alertActionButtonText)
                } else {
                    self.startLogoOneAnimation()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5 ) { [weak self] in
                        let storyboard = UIStoryboard(name: LocalConstants.homeViewControllerIdentifier, bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: LocalConstants.homeViewControllerIdentifier) as! HomeViewController
                        self?.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        }
    }
}

// MARK: - LogInViewController UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            self.separatorViewForEmail.backgroundColor = LocalConstants.blueBeckgroundColor
            self.separatorViewForPassword.backgroundColor = LocalConstants.grayBeckgroundColor
        } else if textField == passwordTextField {
            self.separatorViewForPassword.backgroundColor = LocalConstants.blueBeckgroundColor
            self.separatorViewForEmail.backgroundColor = LocalConstants.grayBeckgroundColor
            
        }
    }
}




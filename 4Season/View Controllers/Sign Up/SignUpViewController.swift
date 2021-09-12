//
//  SignUpViewController.swift
//  4Season
//
//  Created by Nika on 06.06.21.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var firstnameField: UITextField!
    @IBOutlet private weak var lastnameField: UITextField!
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    // MARK: - Methods
    private func setUpUI() {
        passwordField.isSecureTextEntry = true
    }
    
    // MARK: - IBActions
    @IBAction func signUpButton(_ sender: UIButton) {
        guard let userEmail = emailField.text else { return }
        guard let userPassword = passwordField.text else { return }
        guard let firstName = firstnameField.text else { return }
        guard let lastName = lastnameField.text else { return }
        
        if firstnameField.text?.isEmpty == true {
            self.showAlert(alertText: LocalConstants.firstNameErrorText,
                           alertMessage: LocalConstants.emptyTextAlertMessage,
                           title: LocalConstants.emptyTitle)
            
        } else if lastnameField.text?.isEmpty == true {
            self.showAlert(alertText: LocalConstants.lastNameErrorText,
                           alertMessage: LocalConstants.emptyTextAlertMessage,
                           title: LocalConstants.emptyTitle)
            
        } else if emailField.text?.isEmpty == true {
            self.showAlert(alertText: LocalConstants.emailErrorText,
                           alertMessage: LocalConstants.emptyTextAlertMessage,
                           title: LocalConstants.emptyTitle)
        } else if !isValidEmail(userEmail) {
            self.showAlert(alertText: LocalConstants.passwordErrorText,
                           alertMessage: LocalConstants.invalidEmailText,
                           title: LocalConstants.emptyTitle)
        } else if passwordField.text?.isEmpty == true {
            self.showAlert(alertText: LocalConstants.firstNameErrorText,
                           alertMessage: LocalConstants.emptyTextAlertMessage,
                           title: LocalConstants.emptyTitle)
        } else {
            Auth.auth().createUser(withEmail: userEmail,
                                   password: userPassword) { [weak self] result, error in
                if error != nil {
                    self?.showAlert(alertText: LocalConstants.passwordErrorText,
                                    alertMessage: LocalConstants.invalidPasswordHint,
                                    title: LocalConstants.emptyTitle)
                } else {
                    let firestore = Firestore.firestore()
                    firestore.collection(LocalConstants.users).addDocument(data: [ LocalConstants.fistName: firstName,
                                                                                   LocalConstants.lastNameText: lastName,
                                                                                   LocalConstants.passwordText: userPassword,
                                                                                   LocalConstants.emailText: userEmail
                    ])
                    let storyboard = UIStoryboard(name: LocalConstants.homeViewControllerIdentifier, bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: LocalConstants.homeViewControllerIdentifier) as! HomeViewController
                    self?.navigationController?.pushViewController(vc, animated: true)
                    
                }
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = LocalConstants.emailRegex
        let emailPred = NSPredicate(format: LocalConstants.emailFormat, emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

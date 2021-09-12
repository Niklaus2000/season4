//
//  SignUpExtension.swift
//  4Season
//
//  Created by Nika on 05.09.21.
//

import Foundation
extension SignUpViewController {
    enum LocalConstants {
        static let fistName = "fistName"
        static let users = "users"
        static let firstNameErrorText = " გთხოვთ მიუთითეთ სახელი"
        static let lastNameErrorText = "გთხოვთ მიუთითეთ გვარი"
        static let emailErrorText = "გთხოვთ მიუთითეთ ელ-ფოსტა"
        static let passwordErrorText = "გთხოვთ მიუთითეთ პაროლი"
        static let emptyTextAlertMessage = "არ არის შეყვანილი მონაცემები"
        static let invalidEmailText = "ელექტრონული ფოსტის ფორმატი არასწორია"
        static let invalidPasswordHint = "პაროლი უნდა შედგებოდეს მინუმუმ 6 სიმბოლისგან"
        static let lastNameText = "LastName"
        static let passwordText = "Password"
        static let emailText = "Email"
        static let homeViewControllerIdentifier = "HomeViewController"
        static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        static let emailFormat = "SELF MATCHES %@"
        static let emptyTitle = ""
    }
}

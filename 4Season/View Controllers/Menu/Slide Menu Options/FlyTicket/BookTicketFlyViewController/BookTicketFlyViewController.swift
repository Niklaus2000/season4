//
//  BookTicketFlyViewController.swift
//  4Season
//
//  Created by Nika on 24.07.21.
//

import UIKit
import MessageUI

class BookTicketFlyViewController: UIViewController, MFMailComposeViewControllerDelegate {
    // MARK: -
    @IBOutlet private weak var userfromwhereLabel: UILabel!
    @IBOutlet private weak var usertowhereLabel: UILabel!
    @IBOutlet private weak var userdepartLabel: UILabel!
    @IBOutlet private weak var userreturnLabel: UILabel!
    @IBOutlet private weak var userplanclassLabel: UILabel!
    
    // MARK: - variables
    var ticket_fromwhere = ""
    var ticket_towhere = ""
    var ticket_depart = ""
    var ticket_return = ""
    var ticket_planeclass = ""
    
    // MARK: - Lify Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    // MARK: - Methods
    private func setUpUI() {
        userfromwhereLabel.text = ticket_fromwhere
        usertowhereLabel.text = ticket_towhere
        userdepartLabel.text = ticket_depart
        userreturnLabel.text = ticket_return
        userplanclassLabel.text = ticket_planeclass
    }
    
    private func showMail() {
        guard MFMailComposeViewController.canSendMail() else { return }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["niklausgogichashvili@gmail.com"])
        composer.setSubject("ფრენის დაჯავშნა")
        composer.setMessageBody("მსურს დავჯავშნო ფრენის ბილეთი, გთხოვთ დამიკავშირდეთ და შევათანხმოთ ვიზიტის დრო ", isHTML: false)
        present(composer, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func didticketbookClick(_ sender: UIButton) {
        showMail()
    }
}

//
//  TaxCallViewController.swift
//  4Season
//
//  Created by Nika on 19.07.21.
//

import UIKit

class TaxCallViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var taximageView: UIImageView!
    @IBOutlet private weak var taxnameLabel: UILabel!
    @IBOutlet private weak var taxnumberLabel: UILabel!
    @IBOutlet private weak var taxcolorLabel: UILabel!
    @IBOutlet private weak var taxcallnumberLabel: UILabel!
    
    // MARK: - variables
    var tax_name = ""
    var tax_color = ""
    var tax_number = ""
    var tax_callnumber = ""
    
    // MARK: - View Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    private func setUpUI() {
        taxnameLabel.text = tax_name
        taxnumberLabel.text = tax_number
        taxcolorLabel.text = tax_color
        taxcallnumberLabel.text = tax_callnumber
    }
    
    // MARK: - IBActions
    @IBAction func callButton(_ sender: UIButton) {
        guard let  numberString = sender.titleLabel?.text, let url = URL(string: "telnumber://\(numberString)") else {
                return
       }
        UIApplication.shared.open(url)
    }    
}

//
//  TaxViewController.swift
//  4Season
//
//  Created by Nika on 13.06.21.
//

import UIKit

class TaxViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
   
    // MARK: - variables
    var taxList = [Taxdata]()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpUI() {
        tableView.dataSource = self
        tableView.delegate = self
        taxcolor()
    }
    
    private func taxcolor() {
        let tax1 = Taxdata(name: "ნიკა", carColor: "თეთრი", carNumber: "HH-888-UU", ima: "taxicon", mobilenumber: "599316528")
        taxList.append(tax1)
        let tax2 = Taxdata(name: "ბესო", carColor: "თეთრი", carNumber: "HH-456-UU", ima: "taxicon", mobilenumber: "599316580")
        taxList.append(tax2)
        let tax3 = Taxdata(name: "გიორგი", carColor: "თეთრი", carNumber: "HH-379-UU", ima: "taxicon", mobilenumber: "578209326")
        taxList.append(tax3)
        let tax4 = Taxdata(name: "ნიკა", carColor: "თეთრი", carNumber: "HH-888-UU", ima: "taxicon", mobilenumber: "577002677")
        taxList.append(tax4)
        let tax5 = Taxdata(name: "ნიკა", carColor: "თეთრი", carNumber: "HH-888-UU", ima: "taxicon", mobilenumber: "555004321")
        taxList.append(tax5)
        let tax6 = Taxdata(name: "ნიკა", carColor: "თეთრი", carNumber: "HH-888-UU", ima: "taxicon", mobilenumber: "595123456")
        taxList.append(tax6)
        
        let nib = UINib.init(nibName: "TaxTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
}

// MARK: - TableView Extensions
extension TaxViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taxList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaxTableViewCell
        cell.nameLabel.text = taxList[indexPath.row].names
        cell.carColorLabel.text = taxList[indexPath.row].carColors
        cell.carNumberLabel.text = taxList[indexPath.row].carNumbers
        cell.carCallNumberLabel.text = taxList[indexPath.row].mobilenumbers
        cell.yandexImageView.image = UIImage(named: taxList[indexPath.row].image)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard.init(name: "TaxCallViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TaxCallViewController") as! TaxCallViewController
        

        vc.tax_name = taxList[indexPath.row].names
        vc.tax_color = taxList[indexPath.row].carColors
        vc.tax_number = taxList[indexPath.row].carNumbers
        vc.tax_callnumber = taxList[indexPath.row].mobilenumbers
        
        self.navigationController?.pushViewController(vc, animated: true)
    }    
}


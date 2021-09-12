//
//  FlyTicketViewController.swift
//  4Season
//
//  Created by Nika on 24.07.21.
//

import UIKit

class FlyTicketViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - private variables
    private var ticketList = [FlyTicketdata]()
    
    // MARK: - View Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        flyticket()
    }
    
    private func flyticket() {
        let ticket1 = FlyTicketdata(fromwhre: "თბილისი", towhere: "ბრიუსელი", depart: "20 ივნისი", returnss: "3 აგვისტო", planeclas: "ბიზნსესი")
        ticketList.append(ticket1)
        let ticket2 = FlyTicketdata(fromwhre: "თბილისი", towhere: "ნაზარე", depart: "20 ივლისი", returnss: "10 აგვისტო", planeclas: "ეკონომიური")
        ticketList.append(ticket2)
        let ticket3 = FlyTicketdata(fromwhre: "რიო-დე-ჟანეირო", towhere: "ვენეცია", depart: "20 სექტემბერი", returnss: "10 ნოემბერი", planeclas: "ბიზნსესი")
        ticketList.append(ticket3)
        let ticket4 = FlyTicketdata(fromwhre: "ბარსელონა", towhere: "მადრიდი", depart: "28 მარეტი", returnss: "3 მაისი", planeclas: "ბიზნსესი")
        ticketList.append(ticket4)
        let ticket5 = FlyTicketdata(fromwhre: "ოტავა", towhere: "ტორონტო", depart: "10 დეკემბერი", returnss: "10 იანვარი", planeclas: "ეკონომიური")
        ticketList.append(ticket5)
        let ticket6 = FlyTicketdata(fromwhre: "ვენეცია", towhere: "მილანი", depart: "19 აპრილი", returnss: "3 სექტემბერი", planeclas: "ბიზნსესი")
        ticketList.append(ticket6)
        
        let nib = UINib.init(nibName: "FlyTicketTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
}

// MARK: - FlyTicketViewController Extension
extension FlyTicketViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FlyTicketTableViewCell
        cell.fromwhreLabel.text = ticketList[indexPath.row].fromwhres
        cell.towhereLabel.text = ticketList[indexPath.row].towheres
        cell.departLabel.text = ticketList[indexPath.row].departs
        cell.returnLAbel.text = ticketList[indexPath.row].returnsss
        cell.classLabel.text = ticketList[indexPath.row].planeclass
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "BookTicketFlyViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BookTicketFlyViewController") as! BookTicketFlyViewController
        
       
        vc.ticket_depart = ticketList[indexPath.row].departs
        vc.ticket_fromwhere = ticketList[indexPath.row].fromwhres
        vc.ticket_planeclass = ticketList[indexPath.row].planeclass
        vc.ticket_return = ticketList[indexPath.row].returnsss
        vc.ticket_towhere = ticketList[indexPath.row].towheres
        

        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}



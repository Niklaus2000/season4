//
//  WinterViewController.swift
//  4Season
//
//  Created by Nika on 04.07.21.
//

import UIKit

class WinterHotelViewController: UIViewController {
    
    // MARK: - Variables
    private var winterList = [Winterndata]()

    // MARK: - IBOutlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        winterHotel()
    }
    
    private func winterHotel() {
        let winterHotel1 = Winterndata(wintername: "Landhotel", winterlocation: "Feldberg", winterprice: "$159", winterstar: "https://www.seekpng.com/png/detail/199-1996608_star-rating-3-5-stars.png", wintermain: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/124387417.jpg?k=5556f7a227367669e89fe1ecab5fabbd8f56a7f361c78ee3619620c307832448&o=&hp=1")
        winterList.append(winterHotel1)
        let winterHotel2 = Winterndata(wintername: "Rehetobel", winterlocation: "Appenzell Ausserrhoden", winterprice: "$132", winterstar: "https://www.seekpng.com/png/detail/199-1996608_star-rating-3-5-stars.png", wintermain: "https://media.vrbo.com/lodging/60000000/59900000/59900000/59899935/a3fa9e1e.f10.jpg")
        winterList.append(winterHotel2)
        let winterHotel3 = Winterndata(wintername: "QuadrumHotel", winterlocation: "Gudauri", winterprice: "$193", winterstar: "https://www.seekpng.com/png/detail/199-1996608_star-rating-3-5-stars.png", wintermain: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/246278896.jpg?k=2c80a5421e7ed2c48815f436164550d66082848b94e7c7cbbcd69454ee049648&o=&hp=1")
        winterList.append(winterHotel3)
        let winterHotel4 = Winterndata(wintername: "Norhotal", winterlocation: "Troms og Finnmar", winterprice: "$176", winterstar: "https://www.seekpng.com/png/detail/199-1996608_star-rating-3-5-stars.png", wintermain: "https://media.vrbo.com/lodging/45000000/44130000/44124400/44124335/847f5dca.f10.jpg")
        winterList.append(winterHotel4)
        let winterHotel5 = Winterndata(wintername: "Bakuriani Inn", winterlocation: "Bakusriani", winterprice: "$100", winterstar: "https://www.seekpng.com/png/detail/199-1996608_star-rating-3-5-stars.png", wintermain: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/279474846.jpg?k=c4130917c5d6e452089d4f666fc2b8b0d071477d4374f14707369c409417970f&o=&hp=1")
        winterList.append(winterHotel5)
        let winterHotel6 = Winterndata(wintername: "Litlabjarg Guesthouse", winterlocation: "Hrafnabjorg", winterprice: "$140", winterstar: "https://www.seekpng.com/png/detail/199-1996608_star-rating-3-5-stars.png", wintermain: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/180970473.jpg?k=c7a246a10a60f85bc721e22a3b573162792215c56a80d6a4997f6a011eaf4024&o=&hp=1")
        winterList.append(winterHotel6)
        
        
        let nib = UINib.init(nibName: "WinterTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
    }
}

// MARK: - collectionView extension
extension WinterHotelViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return winterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WinterTableViewCell
        cell.mainImageView.kf.setImage(with: URL(string: winterList[indexPath.row].wintermains))
        cell.nameLabel.text = winterList[indexPath.row].winternames
        cell.locationLabel.text = winterList[indexPath.row].winterlocations
        cell.privceLabel.text = winterList[indexPath.row].winterprices
        cell.hotelstarimageView.kf.setImage(with: URL(string: winterList[indexPath.row].winterstars))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "WinterBookViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WinterBookViewController") as! WinterBookViewController
        
        var images =  [String]()
        var longitude: Double = 0
        var latitude: Double = 0
        
        
        if indexPath.row == 0 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/155061392.jpg?k=e6061d2c32c74be604c41d2dfc4dd5c8ad316d23bfce9a9c5c6adf4e801ae69b&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/235099397.jpg?k=eb5be685d9ff91ad0aff62bd0ffbb80090469db6e8c9cb6b944e3d5c07b480c2&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/235100458.jpg?k=99efc13a3c804049ab89761ece97e44743bea148f1767e6cbeef9af11ec6b7b1&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/235100372.jpg?k=febe45b43429cd51da7e1380cd1d88bc5a7f61f6cdcc8e8cc48a1a0a556949a5&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/235100348.jpg?k=e33962ae35c36464b2a0987a29b6db6f1e22f69e394c52ee3a80f60bfebd2fd2&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/235099539.jpg?k=0cc267f4772c886179ed2561512c653df47191bfcf3183bbe6825b984bdaf24a&o=&hp=1"
            ]
            latitude = 47.859722
            longitude = 8.036392
            
            

        } else if indexPath.row == 1 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/175115546.jpg?k=d3c3408de5526c360569c89db57a6f2f8ee8b8475a239eac7e1a543fb6f27baa&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/294748009.jpg?k=9540bca4b545d8831210c713827bb5f63bb1750659ca6034cdb9a5b742809d7d&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/294748224.jpg?k=a31acb014b049d4d7d3ad7fd583bc1e7706c228fac9f2efcf88b0db2b0c9bed0&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/201846026.jpg?k=eb4cc27257138d394e5f0d08c82f99ef5c6a030f896d22a86ce3528c1155bdcc&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/166073464.jpg?k=70cbaf19b5cf6c673c411910dbf44b1d0b67703a9a906af6beb71bfa8b718015&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/294750290.jpg?k=c8ff4d7d387afb5a6c1dd74eb513d4e1e393a997b72cf9edf760919d3cf79b44&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/294987789.jpg?k=6ac5adfe014e2f9fdbc3020bb3a8c158843d06fc390d23205755593a2b7e4c3e&o=&hp=1"
                
            ]
            latitude = 42.473164774
            longitude = 44.471331448
        }else if indexPath.row == 2 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/304032340.jpg?k=ab5329abef1a6dd791e2dc0446d095c2984b45ad2d8aff103962e009e0b181ec&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/304032330.jpg?k=8b39912282de375109922a858160deb692751b2950c918ae657f5cdfb050db29&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/304032339.jpg?k=aebf4aeb8c9f540fa14ad85780c822b30078d60240d08d5ba5b142cb36ec2129&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/304032348.jpg?k=b8f70558f2c587b565f8276de1b69842f21d929aaa549c9a89324a5838a41226&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/304032357.jpg?k=5fc1b620417a933c74fcdadbdff92dc5c9a27f88c692045b9d9717c0e8aa9a54&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/304032400.jpg?k=4d5a38d372edbafc7a5461a2d517d7180c9a0e742b4936d5f9c49a9d46b15077&o=&hp=1"
            ]
            latitude = 69.682778
            longitude =   18.942778
            
        
            
        }else if indexPath.row == 3 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/77023066.jpg?k=de4e7d0f31d86b12cf0356e2c2ba1768fc762928eb2e927b2f8e88b688136ef1&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/111667345.jpg?k=7621d4568fcdf40d6879a0e6c874f91843317e553db5da0bbcafd2414741bc3d&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/111667369.jpg?k=42a477127e892beb75f539fe70363ba08c01e64db8a302bf58ddc9e5eeceb14e&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/75468139.jpg?k=3dd32d71ea48c125c95f959b4274aa7b05c112b3183661e6d1ef2d4caa89fc01&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/75559065.jpg?k=dc32b9896523f98721a0ee69deaa7bdeaa64ef3e42a33dd0902460af5d3bcdfd&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/75464563.jpg?k=60e2a7ff76245306dfd2e1c221dd6efc161f61d91b57ed52c7da0fdb3b3f6ba6&o=&hp=1"
                
            ]
            latitude = 41.346176
            longitude = 2.168365
            
        }else if indexPath.row == 4 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/256982141.jpg?k=c215d0f1c5e9beaea045f020eb4c421191d266c312c9a9c3799be472769000ff&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/256982135.jpg?k=b2ad49b48f9d97019fd56a8ad89d2eeac695d4ca7d926068a783a468e3ff0d17&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/256982130.jpg?k=cf10f54a8b0c349174e36eaed060e59f75afc248e7a41875ea2f453e3c3cf717&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/256982140.jpg?k=d04867379718f1b42c812f975d8d6928d6cfa2fa7e0bcca67c16e047b88f9cb9&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/256982177.jpg?k=7f5945edad11ea1a29b0a859f7a32bee99611767487f2594b3572df0718e8504&o=&hp=1",
                "d52f919367b7dcc62bc11e304fa589b68243364a94ca45b4c9f7448c4f27c30f"
                
            ]
           
            latitude  =  41.750972
            longitude  =  43.529185
            
        }else if indexPath.row == 5 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/273102788.jpg?k=bf3858af0c79fdea0f60eb8e5d944ced6d127dbe1e644e7b38a18410b8a83f50&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/273103950.jpg?k=30da5ca3a66106a0c7f8e5f72e0c680090835f57133d270f21514f20cc23da99&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/273103953.jpg?k=9563a5d69de9aacbc590f9eb546e8573df8d05d161003e9d5a2228006f1f2e39&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/273103306.jpg?k=de42e12c3c9dc021cf827d5f1c08b01ccd97a02aa4e83bffaa0e6d532b2922cf&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/273103310.jpg?k=1a93b57069d924805ea2a9371c5fbd1e2bad10902c76f9a76549e2d6d2e592df&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/273103054.jpg?k=60dcd92f3c0449ac8bf5bccad4d6285e05714aa8827a03d7b89a3a9074b42ca8&o=&hp=1"
                
            ]
            latitude =  64.967
            longitude = -21.750
        }
        
        images.forEach { images in
            vc.imagesArr.append(images)
            
        }
        vc.hotelname = winterList[indexPath.row].winternames
        vc.hotelloacation = winterList[indexPath.row].winterlocations
        vc.hotelprice = winterList[indexPath.row].winterprices
        vc.latitude = latitude
        vc.longitude = longitude
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}


//
//  SummerViewController.swift
//  4Season
//
//  Created by Nika on 04.07.21.
//

import UIKit
import Kingfisher

class SummerHotelViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Variables
    private var summerList = [Summerdata]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self       
        summerHotel()
    }
    
    private func summerHotel() {
        let summerHotel1 = Summerdata(summername: "Paragraph Resort & Spa Shekvetili, Autograph Collection" , summerlocation: "Batumi" , summerprice: "100$" ,  summerstar: "https://media.istockphoto.com/vectors/five-yellow-stars-customer-product-rating-icon-fow-web-applications-vector-id1140391316?k=6&m=1140391316&s=612x612&w=0&h=WFaqpmF2Ib51eLshPGKeiSSGer4lgI1if8Od2dtRDTo=" , summermain: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/117191574.jpg?k=592d4a9831edb18ffec412975011ad8962babb98608e11bc7115b725f07f4d66&o=&hp=1" )
        summerList.append(summerHotel1)
        let summerHotel2 = Summerdata(summername: "Hotel Nikko San Francisco", summerlocation: " San Francisco ", summerprice: "$211", summerstar: "https://media.istockphoto.com/vectors/five-yellow-stars-customer-product-rating-icon-fow-web-applications-vector-id1140391316?k=6&m=1140391316&s=612x612&w=0&h=WFaqpmF2Ib51eLshPGKeiSSGer4lgI1if8Od2dtRDTo=", summermain: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/47249789.jpg?k=9b5274d116a390c6db0f092c71c7d981b60a6f4236aeeea282e32232b620e9d6&o=&hp=1" )
        summerList.append(summerHotel2)
        let summerHotel3 = Summerdata(summername: "By the Beach", summerlocation: "Nazare", summerprice: "$112", summerstar: "https://t4.ftcdn.net/jpg/02/98/16/63/360_F_298166352_tlyPez9gIIkUIPe8gX1qQaur42YC5Zjo.jpg", summermain: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/164107835.jpg?k=0c159de946bea5e792734bfb3f29524677227ee3e6eb2c7fadcf7d71cf5bc7d4&o=&hp=1")
        summerList.append(summerHotel3)
        let summerHotel4 = Summerdata(summername: "Vincci Bit ", summerlocation: "Barcelona", summerprice: "$132", summerstar: "https://thumbs.dreamstime.com/b/d-yellow-four-star-color-background-render-illustration-golden-premium-review-199125662.jpg", summermain: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/9732662.jpg?k=9fd30524093e641e1970be07e2c5a3b62d1fd43ef9ebc1c2f77c8504832e5895&o=&hp=1")
        summerList.append(summerHotel4)
        let summerHotel5 = Summerdata(summername: " Select Hotel Berlin Gendarmenmarkt", summerlocation: "Berlin", summerprice: "$4,346", summerstar: "https://t4.ftcdn.net/jpg/02/98/16/63/360_F_298166352_tlyPez9gIIkUIPe8gX1qQaur42YC5Zjo.jpg", summermain: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/153597003.jpg?k=99a772ba98d4c4aed098c7897df0a61d631857397b510b966e702b3ca79fc408&o=&hp=1")
        summerList.append(summerHotel5)
        let summerHotel6 = Summerdata(summername: "Garten- und Kunsthotel Gabriel City", summerlocation: "Viena", summerprice: "$94", summerstar: "https://t4.ftcdn.net/jpg/02/98/16/63/360_F_298166352_tlyPez9gIIkUIPe8gX1qQaur42YC5Zjo.jpg", summermain: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/307939344.jpg?k=065c95ea01b33f10fe98f7f3bb31cde855c57ae91574e437b60137d98bedf546&o=&hp=1")
        summerList.append(summerHotel6)
        
        
        
        let nib = UINib.init(nibName: "SummerHotelTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
}

// MARK: - TableView extension
extension SummerHotelViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return summerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SummerHotelTableViewCell
        cell.summerImageView.kf.setImage(with: URL(string: summerList[indexPath.row].summermains))
        cell.summernameLabel.text = summerList[indexPath.row].summernames
        cell.summerlocationLabel.text = summerList[indexPath.row].summerlocations
        cell.summerpriceLabel.text = summerList[indexPath.row].summerprices
        cell.summerhotelstarImage.kf.setImage(with: URL(string: summerList[indexPath.row].summerstars))
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "SummerBookViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SummerBookViewController") as! SummerBookViewController
        
        var images =  [String]()
        var longitude: Double = 0
        var latitude: Double = 0
        
        if indexPath.row == 0 {
            images = [                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/117191574.jpg?k=592d4a9831edb18ffec412975011ad8962babb98608e11bc7115b725f07f4d66&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/176220932.jpg?k=8bb09fcbda996506348eaa1fd743cfe4ac481c90d90a2a8c2d7cf7b6e93eb24d&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/175827342.jpg?k=40dbbb8fba096fd45a7b9eaa80b1c0fd5a6098e118f9b63ac8e358b5cbca6f09&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/117191582.jpg?k=82c1eb01f86e0a79ee8762425d8c53e53ff3c7f5321b638ddcc5ef03003239df&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/176220698.jpg?k=eb9506e67b6bcd117b22da04c411131e5b8d968c52dc9b1ac62bb384d1ae1c38&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/176220757.jpg?k=209072c9e61fdb40e97de3e7c47b21dc20c0bfeadff7ad2525428b8309237240&o=&hp=1"
            ]
            longitude =  41.639900
            latitude = 41.643414

        } else if indexPath.row == 1 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1024x768/47249789.jpg?k=9b5274d116a390c6db0f092c71c7d981b60a6f4236aeeea282e32232b620e9d6&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/100962130.jpg?k=27e8b987192cc46ea8e947fcdee59dd89f3711f03ad4b1c443bd15677b8d4ac8&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/100962186.jpg?k=c8174dbc5d6c35ccc3e82ad17374f7e22b112f6647b426da14daacfde7dbada1&o=&hp=1",
                "https://www.booking.com/hotel/us/nikko-san-francisco.en-gb.html?aid=303948&label=Lisse-tylT5RA1EaMDrXuRwi7SXAS504771740541%3Apl%3Ata%3Ap15%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atiaud-297601666515%3Akwd-3412232541%3Alp1007469%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9Yf5EcukO1MOGLSSAuId8ToA&sid=05981f597cbc5c3dce18ceb0c6d9fb65&all_sr_blocks=5855401_238769769_0_0_0&checkin=2021-08-19&checkout=2021-08-20&dest_id=2279&dest_type=region&dist=0&group_adults=2&group_children=0&hapos=15&highlighted_blocks=5855401_238769769_0_0_0&hpos=15&no_rooms=1&room1=A%2CA&sb_price_type=total&sr_order=popularity&sr_pri_blocks=5855401_238769769_0_0_0__16915&srepoch=1627297047&srpvid=b2d34d0babd1021e&type=total&ucfs=1&activeTab=photosGallery",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/19597000.jpg?k=dfad8c60d725f6ec9b0897a5d1d96c98b2f50efe0c142cc0e1db5ce423da4424&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/19597703.jpg?k=28de27772ca829526057dfbf9a9df0af3c4ad1be0ad6a5db69bbbfeca714ceaa&o=&hp=1"
                
            ]
            latitude =  37.77493
            longitude = -122.41942
            
        }else if indexPath.row == 2 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/164107835.jpg?k=0c159de946bea5e792734bfb3f29524677227ee3e6eb2c7fadcf7d71cf5bc7d4&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/163125616.jpg?k=71592e6341732dde5dd7b97f43ad694ad22eb9d55c4902444baaf4314f4d8dec&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/163664539.jpg?k=254c6e1eeffc91205aa214958a85a6110572a6fc4217db475c1acbfc925f7c60&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/163125612.jpg?k=4c4dd8f2b917f1b9bad817ac2e9f54804d7f4d4e889070391538fb0db2e5b439&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/163125616.jpg?k=71592e6341732dde5dd7b97f43ad694ad22eb9d55c4902444baaf4314f4d8dec&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/xphoto/max1024/69130174.webp?k=62f13be16063461dd5db7945d37e6e8efec9953084bb9e96e8b6318a52ce4722&o="
            ]
            latitude = 39.601875
            longitude =   -9.071212
            
        
            
        }else if indexPath.row == 3 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/9732662.jpg?k=9fd30524093e641e1970be07e2c5a3b62d1fd43ef9ebc1c2f77c8504832e5895&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/43268820.jpg?k=635afd7a04a7d0f86093cc09e8790775d032bfed390406f87e8950d6b1b15eee&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/43268851.jpg?k=e12c9060c09949ac8dda45fad1ce6268dd6213925da8737cb8cb9e49c209cce1&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/12658239.jpg?k=d56ef07282c4ae88d7a4e8f98c55a2bd8283a8bb38ed26c9b6fa75e822b07831&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/86931938.jpg?k=bb6d02279a9cd7edf244e5ad079caeb6ad61b5a6954fa8d16e17f40fa5d8675d&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/9732318.jpg?k=0e8f663fa86189d2308c49c2664d09d73a9a52ebef73f607c7ca55b4090f04b7&o=&hp=1"
                
            ]
            latitude = 41.346176
            longitude = 2.168365
            
        }else if indexPath.row == 4 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1024x768/153597003.jpg?k=99a772ba98d4c4aed098c7897df0a61d631857397b510b966e702b3ca79fc408&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1024x768/168613200.jpg?k=f4ede86b40f460009f82b0ea15ad236a480c6a8877807ddc2d064dee7ca78115&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1024x768/168611968.jpg?k=0113cd67bdf56d9bb54abfee2887c4ec16f604ea6a8ca49dc4f20189aa3df929&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1024x768/168602002.jpg?k=93fe6577cb7ddeadff50212fc63f9e8100a4ef385860cc5215846e076bbe5fe8&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/168615093.jpg?k=a2e773d741cab8410b0d62518be1bfe28cad45691778c1cfca9bb4483a23915a&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/168613019.jpg?k=5edeb932f5ed63c4f9168b2d9fed7274c9253898104261d2ae2292c45220e39c&o=&hp=1"
                
            ]
           
            latitude  =  52.520008
            longitude  =  13.404954
            
        }else if indexPath.row == 5 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/307939344.jpg?k=065c95ea01b33f10fe98f7f3bb31cde855c57ae91574e437b60137d98bedf546&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/307939511.jpg?k=4e713ad04dc5935677204d40a6f87f59142c7cb98020554a37907bc4d53593ba&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/307939552.jpg?k=e6692861ff4f0647228740b4673bd3ab8901bc43c5cfd31e42e35191742fe162&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/307939568.jpg?k=97f762be32ace1b0f01bdc72c5c4999f8c14319e20b4ba1b65e46cfc8ae776bc&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/307939830.jpg?k=599a51fc65aswe`zxz≈dqdaqdada7cfdcb5850b7ac78b1d51c05418e5a6105cd170ea81c97849226f9&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/307939315.jpg?k=ef8487d7631b19a7ee0fa1c7b45994f53b2ef9a38ac13698746f5153f740644a&o=&hp=1"
                
            ]
            latitude =  48.240345
            longitude = 16.409874
        }
        
        
        images.forEach { images in
            vc.imagesArr.append(images)
        }

        
        vc.hotelname = summerList[indexPath.row].summernames
        vc.hotelloacation = summerList[indexPath.row].summerlocations
        vc.hotelprice = summerList[indexPath.row].summerprices
        vc.latitude = latitude
        vc.longitude = longitude
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

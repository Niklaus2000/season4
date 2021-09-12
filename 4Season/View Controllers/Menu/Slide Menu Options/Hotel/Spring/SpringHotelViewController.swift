//
//  SpringViewController.swift
//  4Season
//
//  Created by Nika on 04.07.21.
//

import UIKit


class SpringHotelViewController: UIViewController {
    
    var springList = [SpringData]()
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        springHotel()
        
    }
    func springHotel() {
        let springHotel1 = SpringData(springname: "Yufuin Hoteiya " , springlocation: "Yufu" , springprice: "$165", springstar: "https://t4.ftcdn.net/jpg/02/98/16/63/360_F_298166352_tlyPez9gIIkUIPe8gX1qQaur42YC5Zjo.jpg" , springmain: "https://content.r9cdn.net/rimg/himg/f9/e0/88/booking-701927-178628134-539781.jpg?width=915&height=345&xhint=552&yhint=341&crop=true")
        springList.append(springHotel1)
       
        let springHotel2 = SpringData(springname: "Jiannanshan Garden Homestay", springlocation: "Kunming", springprice: "$57", springstar: "https://www.kindpng.com/picc/m/54-544343_two-star-rating-png-transparent-png.png", springmain: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/271617105.jpg?k=8405e824ad4bf98226cb235942214af0af4675934a4eee2a405f25961036f6d2&o=&hp=1")
        springList.append(springHotel2)
       
        let springHotel3 = SpringData(springname: "Mariahoeve-Logies", springlocation: "Woubrugge", springprice: "$160", springstar: "https://lh3.googleusercontent.com/proxy/gq0mUyFH6ckcO2CX636XAXzonLtne7MWed00TFWXrJFHj0m_PwITCssblKqzo7L2qjMh03ocKuBan2WTH6e8wmluCKexESAi_7JAIQKM-mLJD36p8kGy662KuVOLGWB9B8AotflHKwdMihDedGENcebfp6c5WIkO", springmain: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/277599913.jpg?k=40ca45bf0a1a5736eda651538bdb9c84031ee434e9157e6ae2b058cb57c26eb9&o=&hp=1")
        springList.append(springHotel3)
        
        let springHotel4 = SpringData(springname: "Family Guesthouse GreenSLO", springlocation: "Ljubljana", springprice: "$615", springstar: "https://t4.ftcdn.net/jpg/02/98/16/63/360_F_298166352_tlyPez9gIIkUIPe8gX1qQaur42YC5Zjo.jpg", springmain: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/154693393.jpg?k=6e421e84313dd01382b37cfed92394bd029a96b46b9df2c47d838b5bebd0968c&o=&hp=1" )
        springList.append(springHotel4)
     
        let springHotel5 = SpringData(springname: "The Larches Ledbury", springlocation: "Ledbury", springprice: "$1,316", springstar: "https://thumbs.dreamstime.com/b/d-yellow-four-star-color-background-render-illustration-golden-premium-review-199125662.jpg", springmain: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/265300724.jpg?k=ca1c260d2fe6297efaace6e704ca739593132384b4f22efde30229838a8b4ece&o=&hp=1")
        springList.append(springHotel5)
        
        let springHotel6 = SpringData(springname: "Stay of Queenstown", springlocation: "Queenstown", springprice: "$3,941", springstar: "https://thumbs.dreamstime.com/b/d-yellow-four-star-color-background-render-illustration-golden-premium-review-199125662.jpg", springmain: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/265300724.jpg?k=ca1c260d2fe6297efaace6e704ca739593132384b4f22efde30229838a8b4ece&o=&hp=1" )
        springList.append(springHotel6)
        
        let nib = UINib.init(nibName: "SpringHotelTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
}

extension SpringHotelViewController: UITableViewDataSource,  UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return springList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SpringHotelTableViewCell
        cell.springImageView.kf.setImage(with: URL(string: springList[indexPath.row].springmains))
        cell.springnameLabel.text = springList[indexPath.row].springnames
        cell.springlocationLabel.text = springList[indexPath.row].springlocations
        cell.springpriceLabel.text = springList[indexPath.row].springprices
        cell.springhotelstarImage.kf.setImage(with: URL(string: springList[indexPath.row].springstars))
        
        
        
        return cell
        

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard.init(name: "SpringBookViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SpringBookViewController") as! SpringBookViewController
        
        var images =  [String]()
        var longitude: Double = 0
        var latitude: Double = 0
        
        if indexPath.row == 0 {
            images = [
                "https://content.r9cdn.net/rimg/himg/f9/e0/88/booking-701927-178628134-539781.jpg?width=915&height=345&xhint=552&yhint=341&crop=true",
                "https://content.r9cdn.net/rimg/himg/0a/d3/92/booking-701927-34343763-image.jpg?width=915&height=345&xhint=552&yhint=341&crop=true",
                "https://content.r9cdn.net/rimg/himg/69/a0/cc/booking-701927-273659279.jpg_k=2412d9e7c386775eb8b02c8018037d5d8ef48f5f2ca06739e3b6de5c19d70b7f_o=-278573.jpg?width=915&height=345&xhint=420&yhint=230&crop=true",
                "https://content.r9cdn.net/rimg/himg/1b/ec/40/booking-701927-205441757-983169.jpg?width=915&height=345&xhint=512&yhint=399&crop=true",
                "https://content.r9cdn.net/rimg/himg/1b/ec/40/booking-701927-205478126-194663.jpg?width=915&height=345&xhint=512&yhint=352&crop=true",
                "https://content.r9cdn.net/rimg/himg/69/a0/cc/booking-701927-238849912.jpg_k=6e62a4e0623ad733bc2f047bb6edfe95e6c0344d3cd42e8bb330f20dfa9b388d_o=-040967.jpg?width=915&height=345&xhint=369&yhint=230&crop=true"
                
                
                     ]
            
            longitude = 131.4322
            latitude = 33.1792

        } else if indexPath.row == 1 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1024x768/271617105.jpg?k=8405e824ad4bf98226cb235942214af0af4675934a4eee2a405f25961036f6d2&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/294238530.jpg?k=f00115274a81520b40d2b4b29f7b841b2bb1ab54650c774043cafb224bdbd596&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/284534854.jpg?k=ae00ace36ad3de9d397bf7fd5b6e284ac53f8d07d264a110379200d1c6fb7ca3&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/284534547.jpg?k=ccc0c30b1ccbbd2031f56f1b93ac7779ab55eb1cfabd305232ae038c9a2acaa3&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/284534579.jpg?k=99b3ade563b1cbe962305863f0b84d334f4f4957e51a3f426d755b2ead7eabf8&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/284534432.jpg?k=5ccde55c088560f431de9ec210fb33679c7e35a7df24a7f609f0ed7f4eb14699&o=&hp=1"
                
            ]
            latitude =  25.043333
            longitude = -122.41942
            
        }else if indexPath.row == 2 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/277599913.jpg?k=40ca45bf0a1a5736eda651538bdb9c84031ee434e9157e6ae2b058cb57c26eb9&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/277599922.jpg?k=ab3ea35fa2bb69a0a7533d13249442f139152d47322f8a03547aaad9e2cdb607&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/277599923.jpg?k=fe79d71015bf0881aec7bce548ce08c0c62c432bed6596925bb3ffe26cab2f9f&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/277599928.jpg?k=71551fe5be3c03d277a19f15a1ec1de620439076e8a5990463c8f29e516d8ade&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/277599936.jpg?k=6226f4ad709d8ee75182254df0cf0fc04200eef77aa4b38a6328cca5442c9cd4&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/277599925.jpg?k=3b0c589684b171adfb7a857ef4fc835dee99d6b67f41dc65a871b8676399d310&o=&hp=1"

            ]
            latitude = 52.1687819
            longitude =  4.6375651
            
        
            
        }else if indexPath.row == 3 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/154693393.jpg?k=6e421e84313dd01382b37cfed92394bd029a96b46b9df2c47d838b5bebd0968c&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/157467141.jpg?k=70281c78dab5a33ed42f1f2ca669a3965a18bb6c85771de718925a624fa8d35a&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/154696805.jpg?k=0355cbc2f5b4130f82d957f1d00140be4853d1d58eb9692eb8118417a13351b6&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/154693335.jpg?k=e4ab4ec53fcd70b7df869970d4c803418a806d4af091be8a0b62b7aa58ab53d3&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/266137593.jpg?k=b089fca163d6a0f807bf813af2cb451400a507efdda93b45bf1fe946dd226eec&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/266137554.jpg?k=9648a092b073755a052da73309967d82c40c15892121ee54ba47e8f2ac74fd3c&o=&hp=1"
                
            ]
            latitude = 46.056946
            longitude = 14.505751
            
        }else if indexPath.row == 4 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/265300724.jpg?k=ca1c260d2fe6297efaace6e704ca739593132384b4f22efde30229838a8b4ece&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/190468024.jpg?k=6a8127d4a268293e5775e6c9521634eb29cac2cc98c0793349b6ac3b334ddb7e&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/265278526.jpg?k=a196591773dc65dd87917d7e2b92e594613c39aef02cd63aea08c6ae132ef8c2&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/190468089.jpg?k=bd570553e4e1882f7aa0eff8449fdd68de37618129ac5a08a24fd958c98606d0&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/265278553.jpg?k=601aca977154ae746e5870756eb2653e67a46a7ecfb0fb5b3ab028e4451c1534&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/190470139.jpg?k=f1ceb354da579f75a58960f6d6779a0e709dc5d429a2e2d14a7231d993bb6e5e&o=&hp=1"
                
            ]
           
            latitude  =  52.033882
            longitude  =  2.423574
            
        }else if indexPath.row == 5 {
            images = [
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/292010469.jpg?k=a6733663351a9a523169777370112156442e94d40d560abd2f4b1440eb5b7871&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/283659834.jpg?k=36e955200aebdf7d99b7c17171be4ad6cc59fb5446115f9c08e9d0b041dc3d37&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/283659819.jpg?k=1924bf22939b4750faae1b9931bf00be7b4a38b28f5a737fde24f28bb816a170&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/283659810.jpg?k=b612c8328d8057959273798e5e8cd4c7d976322878ac36ab99ec90bcafaf222d&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/283659782.jpg?k=31d6eff72c58aaeb5b2eab0d1c16fd1f01915cf10b3c0e5eed028e07eddf0c93&o=&hp=1",
                "https://cf.bstatic.com/xdata/images/hotel/max1280x900/283659765.jpg?k=8c0f1d682bccccb5de3026f2aa3125a344d17577ab40015ea4d1b0ca083f15e2&o=&hp=1"
                
            ]
            latitude =  -45.031162
            longitude = 168.662643
        }

        images.forEach { images in
            vc.imagesArr.append(images)
        }
        
        
        vc.hotelname = springList[indexPath.row].springnames
        vc.hotelloacation = springList[indexPath.row].springlocations
        vc.hotelprice = springList[indexPath.row].springprices
        vc.latitude = latitude
        vc.longitude = longitude
    
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}





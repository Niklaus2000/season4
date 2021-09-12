//
//  SummerData.swift
//  4Season
//
//  Created by Nika on 25.07.21.
//

import Foundation

class Summerdata {
    var summernames: String
    var summerlocations: String
    var summerprices: String
    var summerstars: String
    var summermains: String
//    var latitudes: Double
//    var longitudes: Double
    
    
    init(summername: String, summerlocation: String,  summerprice: String,  summerstar: String, summermain: String) {
        summernames = summername
        summerlocations = summerlocation
        summerprices = summerprice
        summerstars = summerstar
        summermains = summermain
//        latitudes =  latitude
//        longitudes = longitude
        
    }
}

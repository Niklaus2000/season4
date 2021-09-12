//
//  TaxData.swift
//  4Season
//
//  Created by Nika on 18.07.21.
//

import Foundation

class Taxdata {
    var names: String
    var carColors: String
    var carNumbers: String
    var image: String
    var mobilenumbers: String
    
    init(name: String, carColor: String,  carNumber: String,  ima: String, mobilenumber: String) {
        names = name
        carColors = carColor
        carNumbers = carNumber
        image = ima
        mobilenumbers = mobilenumber
    }
}


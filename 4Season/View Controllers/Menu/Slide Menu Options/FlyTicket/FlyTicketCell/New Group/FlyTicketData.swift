//
//  FlyTicketData.swift
//  4Season
//
//  Created by Nika on 24.07.21.
//

import Foundation

class FlyTicketdata {
    var fromwhres: String
    var towheres: String
    var departs: String
    var returnsss: String
    var planeclass: String
    
    init(fromwhre: String, towhere: String,  depart: String,  returnss: String, planeclas: String) {
        fromwhres = fromwhre
        towheres = towhere
        departs = depart
        returnsss = returnss
        planeclass = planeclas
    }
}

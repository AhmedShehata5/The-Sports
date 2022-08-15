//
//  Countries.swift
//  TheSports
//
//  Created by Ahmed Shehata on 08/08/2022.
//


import Foundation


struct Countries: Codable{
    var countries: [Country]
    
}

struct Country: Codable{
    var name: String
    
    enum CodingKeys: String, CodingKey{
        case name = "name_en"
    }
    
}

//
//  SeasonsOfLeague.swift
//  TheSports
//
//  Created by Ahmed Shehata on 08/08/2022.
//

import Foundation

struct SeasonsOfLeague: Codable{
    var seasons: [Season]
}

struct Season: Codable{
    var season: String
    
    enum CodingKeys: String, CodingKey{
        case season = "strSeason"
    }
    
}


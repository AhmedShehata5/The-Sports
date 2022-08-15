//
//  Sports.swift
//  TheSports
//
//  Created by Ahmed Shehata on 08/08/2022.
//

import Foundation
import UIKit



struct Sports: Codable{
    var sports: [Sport]
   
}

struct Sport: Codable{
    var id: String
    var name: String
    var formate: String
    var imageUrl: URL!
    var iconUrl: URL!
    var description: String
    
    var images: Images = Images()
    
    
    enum CodingKeys: String, CodingKey{
        case id = "idSport"
        case name = "strSport"
        case formate = "strFormat"
        case imageUrl = "strSportThumb"
        case iconUrl = "strSportIconGreen"
        case description = "strSportDescription"
        
        
        
    }

}


struct Images{
    var image: UIImage!
    var icon: UIImage!
}

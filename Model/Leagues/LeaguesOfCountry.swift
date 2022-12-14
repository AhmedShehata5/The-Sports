//
//  LeaguesOfCountry.swift
//  TheSports
//
//  Created by Ahmed Shehata on 08/08/2022.
//

import Foundation
import UIKit

struct LeaguesOfCountry: Codable{
    var leagues: [League]
    
    enum CodingKeys: String, CodingKey{
        case leagues = "countries"
    }
}

struct League: Codable{
    var id : String
    
    var sport: String
    var country: String
    var name: String
    var alternate: String
    var gender: String
    var currentSeason: String!
    var formedYear: String!
    var firstEventDate: String!
    
    var website: String
    var facebook: String
    var instagram: String
    var twitter: String
    var youtube: String
    
    var description: String!
    
    var banner: URL!
    var badge: URL!
    var logo: URL!
    var poster: URL!
    var trophy: URL!

    var strFanart1: URL!
    var strFanart2: URL!
    var strFanart3: URL!
    var strFanart4: URL!
    
    var links: [[String: String]]{
        return [
            [
                "link": website,
                "image": "web"
            ],
            [
                "link": facebook,
                "image": "facebook"
            ],
            [
                "link": instagram,
                "image": "instagram"
            ],
            [
                "link": twitter,
                "image": "twitter"
            ],
            [
                "link": youtube,
                "image": "youtube"
            ]
        ]
        
    }

    var fanares: [URL?]?{
        let t = [strFanart1, strFanart2, strFanart3, strFanart4].filter {$0 != nil}
        
        if t.count > 0{
            return t
        }
        return nil // if nil will hide the collection view
    }

    var images: LeagueImages = LeagueImages()
    
    enum CodingKeys: String, CodingKey{
        case id = "idLeague"
        case sport = "strSport"
        case country = "strCountry"
        case name = "strLeague"
        case alternate = "strLeagueAlternate"
        case gender = "strGender"
        case currentSeason = "strCurrentSeason"
        case formedYear = "intFormedYear"
        case firstEventDate = "dateFirstEvent"
        case website = "strWebsite"
        case facebook = "strFacebook"
        case instagram = "strInstagram"
        case twitter = "strTwitter"
        case youtube = "strYoutube"
        case description = "strDescriptionEN"
        case banner = "strBanner"
        case badge = "strBadge"
        case logo = "strLogo"
        case poster = "strPoster"
        case trophy = "strTrophy"
        case strFanart1, strFanart2, strFanart3, strFanart4

        
        
    }
}

struct LeagueImages{
    
    var banner: UIImage!
    var badge: UIImage!
    var logo: UIImage!
    var poster: UIImage!
    var trophy: UIImage!

    var fanares: [UIImage]!
    
}

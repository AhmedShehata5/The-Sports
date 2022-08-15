//
//  Teams.swift
//  TheSports
//
//  Created by Ahmed Shehata on 08/08/2022.
//

import Foundation


struct Teams: Codable{
    var teams: [Team]
}


struct Team: Codable{
    var id: String
    var name: String
    var alternate: String
    var formedYear: String
    var sport: String
    var league: String
    var leagueId: String
    var stadiumName: String
    var stadiumDescription: String!
    var stadiumLocation: String
    var stadiumCapacity: String
    var website: String
    var facebook: String
    var twitter: String
    var instagram: String
    var description: String!
    var gender: String
    var country: String
    var badge: URL!
    var jersey: URL!
    var logo: URL!
    
    var strTeamFanart1: URL!
    var strTeamFanart2: URL!
    var strTeamFanart3: URL!
    var strTeamFanart4: URL!
    
    var fanarts: [URL?]{
        return [strTeamFanart1, strTeamFanart2, strTeamFanart3, strTeamFanart4]
    }
    
    var banner: URL!
    var youtube: String
    
    
    enum CodingKeys: String, CodingKey{
        case id = "idTeam"
        case name = "strTeam"
        case alternate = "strAlternate"
        case formedYear = "intFormedYear"
        case sport = "strSport"
        case league = "strLeague"
        case leagueId = "idLeague"
        case stadiumName = "strStadium"
        case stadiumDescription = "strStadiumDescription"
        case stadiumLocation = "strStadiumLocation"
        case stadiumCapacity = "intStadiumCapacity"
        case website = "strWebsite"
        case facebook = "strFacebook"
        case twitter = "strTwitter"
        case instagram = "strInstagram"
        case description = "strDescriptionEN"
        case gender = "strGender"
        case country = "strCountry"
        case badge = "strTeamBadge"
        case jersey = "strTeamJersey"
        case logo = "strTeamLogo"
        case strTeamFanart1, strTeamFanart2, strTeamFanart3, strTeamFanart4
        case banner = "strTeamBanner"
        case youtube = "strYoutube"
    }
}

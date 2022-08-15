//
//  LeaguesOfCountryRequest.swift
//  TheSports
//
//  Created by Ahmed Shehata on 08/08/2022.
//

import Foundation

class SeasonsOfLeagueRequest: Request{
    var leagueId: String
        
    
    init(leagueId: String) {
        self.leagueId = leagueId
    }
    
    override var url: String{
        return super.url + "search_all_seasons.php"
    }
    
   

    override var queryItems: [URLQueryItem]!{
        let query = ["id": leagueId]

        return query.ConverToQueryItems() // a method added to Dictionary by extention to return Array of URLQueryItem

    }
    
    func featchData() async throws -> SeasonsOfLeague {
        let data  = try await super.featchData(SeasonsOfLeague.self)
        
        return data
    }

    
}


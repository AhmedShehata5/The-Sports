//
//  LeaguesOfCountryRequest.swift
//  TheSports
//
//  Created by Ahmed Shehata on 08/08/2022.
//

import Foundation

class TeamsRequest: Request{
    var country: String!
    var sport: String!
    
    
    init(country: String! = nil, sport: String! = nil) {
        self.country = country
        self.sport = sport
    }
    
    override var url: String{
        return super.url + "search_all_teams.php"
    }
    
   

    override var queryItems: [URLQueryItem]!{
        var query: [String: String] = [:]

        if let country = country{
            query["c"] = country
        }
        if let sport = sport{
            query["s"] = sport
        }
        
        if country != nil || sport != nil{
            return query.ConverToQueryItems()
        }
        
        return nil
            
    }
    
    func featchData() async throws -> Teams {
        
        let data  = try await super.featchData(Teams.self)
        
        return data
    }

    
}


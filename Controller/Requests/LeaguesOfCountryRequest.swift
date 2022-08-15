//
//  LeaguesOfCountryRequest.swift
//  TheSports
//
//  Created by Ahmed Shehata on 08/08/2022.
//

import Foundation

class LeaguesOfCountryRequest: Request{
    var country: String!
    var sport: String!
    
    
    init(country: String! = nil, sport: String! = nil) {
        self.country = country
        self.sport = sport
    }
    
    override var url: String{
        return super.url + "search_all_leagues.php" // leagues endpoint
    }
    
   

    override var queryItems: [URLQueryItem]!{
        var query: [String: String] = [:]

        if let country = country{
            query["c"] = country // add 'c' key to query if country is not nil
        }
        if let sport = sport{
            query["s"] = sport  // add 's' key to query if sport is not nil
        }
        
        if country != nil || sport != nil{
            return query.ConverToQueryItems() // a method added to Dictionary by extention to return Array of URLQueryItem
        }
        
        return nil
            
    }
    
    func featchData() async throws -> LeaguesOfCountry {
        
        let data  = try await super.featchData(LeaguesOfCountry.self)
        
        return data
    }

    
}


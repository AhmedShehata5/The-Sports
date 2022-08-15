//
//  File.swift
//  TheSports
//
//  Created by Ahmed Shehata on 08/08/2022.
//

import Foundation


class SportsRequest: Request{
    
    override var url: String{
        return super.url + "all_sports.php" // Sports endpoint
    }
    
    func featchData() async throws -> Sports {
        
        let data  = try await super.featchData(Sports.self)
        
        return data
    }

    
}

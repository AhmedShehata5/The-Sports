//
//  CountriesRequest.swift
//  TheSports
//
//  Created by Ahmed Shehata on 08/08/2022.
//

import Foundation


class ContriesRequest: Request{
    
    override var url: String{
        return super.url + "all_countries.php"  // countries endpoint
    }
    
    func featchData() async throws -> Countries {
        
        let data  = try await super.featchData(Countries.self)
        
        return data
    }

    
}

//
//  Request.swift
//  TheSports
//
//  Created by Ahmed Shehata on 08/08/2022.
//

import Foundation
import UIKit

class Request{
    // url of the request will overided in request Class
    var url: String {
        return "https://www.thesportsdb.com/api/v1/json/2/"
    }
    // queries of the request will overided in request Class
    var queryItems: [URLQueryItem]! {
        return nil
    }
    //  overided url and overided queryItems
    var urlComponent: URLComponents{
        var component = URLComponents(string: url)!
        component.queryItems = queryItems
        return component
    }
    
    
     func featchData<T>(_ type: T.Type) async throws -> T where T: Codable{
         /*
            this method must implemented in a Task
            takes a custom Swift type and decode JSON data to it
            return a DeCodable object of type
          
            <T>(_ type: T.Type)
            means that it neads a custom Swift type ex: "Sports.self"
            -> T where T: Codable
            means that it must conform Codable protocol
          */
         
         // make a network request
        let (data, response) = try await URLSession.shared.data(from: urlComponent.url!)
        // make sure this request complete correctly
        guard let HttpResponse = response as? HTTPURLResponse, HttpResponse.statusCode == 200 else{
            throw CustomErrors.itemNotFound // if request not complete throw an error
        }
        
//         let string = String(data: data, encoding: .utf8)
        // decode date to the custom type
        let decodedData = try JSONDecoder().decode(type, from: data)
         
        return decodedData

    }
    
    
    static func featchImage(from url: URL) async throws -> UIImage{
        let (date, response) = try await URLSession.shared.data(from: url)
        
        guard let HttpResponse = response as? HTTPURLResponse, HttpResponse.statusCode == 200, let image = UIImage(data: date) else{
            throw CustomErrors.ImageDataMissing
        }
        
        return image
    }

}


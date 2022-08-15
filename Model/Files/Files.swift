//
//  Files.swift
//  TheSports
//
//  Created by Ahmed Shehata on 10/08/2022.
//

import Foundation


enum ModelArchiveURL: String{
    case Sports = "Sports"
    case Countries = "Countries"
    case PreferedLeagues = "PreferedLeagues"
    
}



struct Files{
    var archiveURL: URL
    
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
    init(archiveURL: ModelArchiveURL){
        self.archiveURL = Files.documentsDirectory.appendingPathComponent(archiveURL.rawValue).appendingPathExtension("plist")

    }
    
    func loadModels<T>(_ type: T.Type) -> T? where T: Codable {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else
          {return nil}
        
       let propertyListDecoder = PropertyListDecoder()
       return try? propertyListDecoder.decode(type, from: codedToDos)
   }
    
    func saveToFiles<T>(_ type: T) where T: Codable{
       let propertyListEncoder = PropertyListEncoder()
       let codedToDos = try? propertyListEncoder.encode(type)
       try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
   }
    
}

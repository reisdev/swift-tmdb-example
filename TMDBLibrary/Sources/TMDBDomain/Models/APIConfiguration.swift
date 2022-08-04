//
//  Configuration.swift
//  
//
//  Created by Matheus dos Reis de Jesus on 28/06/22.
//

import Foundation

public struct APIConfiguration: Decodable {
    
    public var images: ImageConfiguration
    public var changeKeys: [String]
    
    enum CodingKeys: String,CodingKey {
        case images
        case changeKeys = "change_keys"
    }
    
    public struct ImageConfiguration: Decodable {
        public var baseUrl: String
        public var secureBaseUrl: String
        public var backdropSizes: [String]
        public var logoSizes: [String]
        public var posterSizes: [String]
        public var profileSizes: [String]
        public var stillSizes: [String]
        
        enum CodingKeys: String,CodingKey {
            case baseUrl = "base_url"
            case secureBaseUrl = "secure_base_url"
            case backdropSizes = "backdrop_sizes"
            case logoSizes = "logo_sizes"
            case posterSizes = "poster_sizes"
            case profileSizes = "profile_sizes"
            case stillSizes = "still_sizes"
        }
    }
}

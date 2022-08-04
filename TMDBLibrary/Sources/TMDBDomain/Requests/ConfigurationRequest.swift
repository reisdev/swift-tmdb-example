//
//  ConfigurationRequest.swift
//  
//
//  Created by Matheus dos Reis de Jesus on 28/06/22.
//

import Foundation
import Moya

public enum ConfigurationRequest {
    case api
    case countries
    case jobs
    case languages
    case primaryTranslations
    case timezones
}

extension ConfigurationRequest: TargetType {
    public var baseURL: URL { URL(string: "https://api.themoviedb.org/3/configuration")! }
    
    public var path: String {
        switch self {
        case .api:
            return ""
        case .countries:
            return "/countries"
        case .jobs:
            return "/jobs"
        case .languages:
            return "/languages"
        case .primaryTranslations:
            return "/primary_translations"
        case .timezones:
            return "/timezones"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    public var task: Task {
        guard let apiKey = ProcessInfo.processInfo.environment["API_KEY"] else {
            fatalError("Missing environment variable API_KEY")
        }
        
        let parameters: [String:String] = ["api_key": apiKey]
        
        switch self {
        default:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
}

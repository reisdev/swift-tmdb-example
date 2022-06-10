//
//  MovieService.swift
//  SwiftUITMDB (iOS)
//
//  Created by Matheus dos Reis de Jesus on 09/06/22.
//

import Foundation
import Moya

public enum MovieRequest {
    case details(id: Int)
    case recommendations(id: Int)
    case images(id: Int)
    case popular
    case topRated
}

extension MovieRequest: TargetType {
    
    public var baseURL: URL { URL(string: "https://api.themoviedb.org/3/movie")! }

    public var path: String {
        switch self {
        case .details(let id):
            return "/\(id)"
        case .recommendations(let id):
            return "/\(id)/recommendations"
        case .images(let id):
            return "/\(id)/images"
        case .popular:
            return "/popular"
        case .topRated:
            return "/top_rated"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .details, .recommendations, .images, .popular, .topRated:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .details, .recommendations, .images, .popular, .topRated:
            return .requestParameters(parameters: ["api_key": "a070f77e96f1633405ab20afb856bd2e"], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return [:]
    }

}

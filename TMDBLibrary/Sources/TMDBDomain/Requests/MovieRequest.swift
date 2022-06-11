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
    case popular(page: Int)
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
        guard let apiKey = ProcessInfo.processInfo.environment["API_KEY"] else {
            fatalError("Missing environment variable API_KEY")
        }
        
        var parameters: [String:String] = ["api_key": apiKey]
        switch self {
        case .popular(let page):
            parameters["page"] = String(page)
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .details, .recommendations, .images, .topRated:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }

}

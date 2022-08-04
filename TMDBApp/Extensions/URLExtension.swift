//
//  URLExtension.swift
//  TMDBApp
//
//  Created by Matheus dos Reis de Jesus on 29/06/22.
//

import Foundation

public enum ImageSize {
    case minimal
    case intermediate
    case maximal
}

extension URL {
    public static func buildPosterUrl(with path: String, size: ImageSize = .intermediate) -> URL? {
        guard let configuration = Constants.shared.apiConfiguration?.images else { return nil }
        let baseUrl = configuration.secureBaseUrl
        
        var posterSize: String = "w500"
        
        switch size {
        case .minimal:
            posterSize = configuration.posterSizes.first ?? posterSize
        case .intermediate:
            posterSize = configuration.posterSizes[Int(configuration.posterSizes.count/2)]
        case .maximal:
            posterSize = configuration.posterSizes.last ?? posterSize
        }
        
        let urlString = "\(baseUrl)\(posterSize)\(path)"
        
        return URL(string: urlString)
    }
}

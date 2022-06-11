//
//  PaginatedMovieResponse.swift
//  
//
//  Created by Matheus dos Reis de Jesus on 11/06/22.
//

import Foundation

public struct PaginatedMovieResponse: Decodable {
    public var page: Int
    public var results: [Movie]
}

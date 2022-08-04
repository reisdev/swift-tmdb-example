//
//  Movie.swift
//  
//
//  Created by Matheus dos Reis de Jesus on 09/06/22.
//

import Foundation

public struct Genre: Codable {
    var id: Int;
    var name: String;
}

public struct Movie: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var overview: String
    public var popularity: Double
    public var voteCount: Int
    public var posterPath: String
    public var backdropPath: String
    public var releaseDate: String
    public var genres: [Genre]? = []
    public var genreIds: [Int]? = []
    public var releaseYear: Int {
        get {
            return Int(releaseDate.split(separator: "-")[0]) ?? 0
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, popularity, overview, genres
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case voteCount = "vote_count"
        case genreIds = "genre_ids"
        case releaseDate = "release_date"
    }
    
    // Retorna as 3 primeiras categorias por ordem alfabética, separadas por vírgula
    public func genresToString() -> String {
        guard let genres = genres else { return "" }
        let limit = min(genres.count,3)
        let formattedGenres = genres.sorted{ $0.name < $1.name }[0..<limit]
            .map{$0.name}
            .reduce("",{$0 == "" ? $1 : "\($0), \($1)" })
        return String(format: "%@", formattedGenres)
    }
}

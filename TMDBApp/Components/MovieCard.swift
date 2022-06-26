//
//  MovieCard.swift
//  TMDBApp
//
//  Created by Matheus dos Reis de Jesus on 25/06/22.
//

import SwiftUI
import TMDBDomain

struct MovieCard: View {
    
    let movie: Movie
    
    var body: some View {
        AsyncImage(url: movie.posterURL) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .cornerRadius(8.0)
                    .aspectRatio(contentMode: .fit)
            case .failure(_):
                EmptyView()
            default:
                CircularProgressView()
            }
        }
    }
}

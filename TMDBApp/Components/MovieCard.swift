//
//  MovieCard.swift
//  TMDBApp
//
//  Created by Matheus dos Reis de Jesus on 25/06/22.
//

import SwiftUI
import TMDBDomain

struct MovieCard: View {
    
    @State private var shimmering = false
    
    let movie: Movie
    
    var body: some View {
        AsyncImage(url: .buildPosterUrl(with: movie.posterPath)) { image in
            image
                .resizable()
                .cornerRadius(8.0)
                .aspectRatio(contentMode: .fit)
                .opacity(shimmering ? 0 : 1.0)
                .animation(.easeOut(duration: 1), value: !shimmering)
        } placeholder: {
            Rectangle().background(Color(UIColor.secondaryLabel))
                .cornerRadius(8.0)
                .frame(height: 260)
                .mask(
                    Rectangle()
                        .fill(
                            Color(UIColor.secondaryLabel).opacity(shimmering ? 0.3 : 0.8)
                        )
                        .cornerRadius(8.0)
                        .animation(.easeInOut(duration: 1.2).repeatForever(), value: shimmering)
                        .onAppear {
                            withAnimation {
                                shimmering.toggle()
                            }
                        }.onDisappear {
                            withAnimation {
                                shimmering.toggle()
                            }
                        }
                )
        }
    }
}

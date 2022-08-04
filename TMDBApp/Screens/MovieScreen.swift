//
//  MovieScreen.swift
//  TMDBApp
//
//  Created by Matheus dos Reis de Jesus on 26/06/22.
//

import SwiftUI
import TMDBDomain

struct MovieScreen: View {
    
    @State var movie: Movie
    
    var body: some View {
        GeometryReader { metrics in
            VStack(alignment: .leading, spacing: 10) {
                AsyncImage(url: .buildPosterUrl(with: movie.backdropPath, size: .maximal)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .background()
                            .aspectRatio(contentMode: .fill)
                    case .failure(_):
                        EmptyView()
                    default:
                        CircularProgressView()
                    }
                }.frame(width: metrics.size.width, height: metrics.size.height * 0.3)
                Text(movie.title)
                    .font(.headline)
                    .bold()
                    .lineLimit(nil)
                    .fixedSize()
                    .padding(.horizontal, 10)
            }.scaledToFill()
        }
    }
}

/*
 struct MovieScreen_Previews: PreviewProvider {
 static var previews: some View {
 MovieScreen()
 }
 }
 */

//
//  PopularMoviesScreen.swift
//  TMDBApp
//
//  Created by Matheus dos Reis de Jesus on 25/06/22.
//

import TMDBDomain
import TMDBServices
import SwiftUI
import RxSwift
import RxCocoa

struct PopularMoviesScreen: View {
    private let disposeBag = DisposeBag()
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    @State private var movies: [Movie] = []
    @State private var page = 1
    
    func getMovies() {
        MovieService.shared.getPopular(page: page).subscribe(onNext: { response in
            self.movies.append(contentsOf: response.results)
        }).disposed(by: disposeBag)
    }
    
    var body: some View {
        NavigationView {
            if movies.count > 0 {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(movies) { movie in
                            NavigationLink(destination: MovieScreen(movie: movie)) {
                                MovieCard(movie: movie)
                            }.navigationViewStyle(.stack)
                        }
                    }.padding(.horizontal, 10.0)
                }.background(Color(UIColor.secondarySystemBackground))
            } else {
                CircularProgressView()
                    .size(150)
                    .task { getMovies() }
            }
        }
    }
}

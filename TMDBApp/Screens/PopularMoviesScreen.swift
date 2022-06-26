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
    
    func getMovies() {
        MovieService.shared.getPopular(page: 1).subscribe(onNext: { response in
            self.movies = response.results
        }).disposed(by: disposeBag)
    }
    
    var body: some View {
        if movies.count > 0 {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(movies) { movie in
                        MovieCard(movie: movie)
                    }
                }
                .padding(.horizontal)
            }.background(Color(UIColor.darkGray))
        } else {
            CircularProgressView()
                .size(150)
                .task { getMovies() }
        }
    }
}

//
//  MovieService.swift
//  
//
//  Created by Matheus dos Reis de Jesus on 10/06/22.
//

import Foundation
import TMDBDomain
import Moya
import RxSwift

struct MovieService: MovieServiceProtocol {
    
    let provider = MoyaProvider<MovieRequest>()
    
    public static var shared: MovieServiceProtocol = {
       return MovieService()
    }()
    
    func getDetails(from id: Int) -> Observable<Movie> {
        return Observable.create { observer in
            provider.request(.details(id: id)) { result in
                switch result {
                case .success(let response):
                    do {
                        let movie = try response.map(Movie.self)

                        observer.onNext(movie)
                    } catch {
                        observer.onError(error)
                    }
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
    
    func getPopular(page: Int = 1) -> Observable<PaginatedMovieResponse> {
        return Observable.create { observer in
            provider.request(.popular(page: page)) { result in
                switch result {
                case .success(let response):
                    do {
                        let popular = try response.map(PaginatedMovieResponse.self)
                        
                        observer.onNext(popular)
                    } catch {
                        observer.onError(error)
                    }
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}

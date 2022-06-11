//
//  MovieServiceProtocol.swift
//  
//
//  Created by Matheus dos Reis de Jesus on 10/06/22.
//

import Foundation
import RxSwift

public protocol MovieServiceProtocol {
    func getDetails(from id: Int) -> Observable<Movie>
    func getPopular(page: Int) -> Observable<PaginatedMovieResponse>
}

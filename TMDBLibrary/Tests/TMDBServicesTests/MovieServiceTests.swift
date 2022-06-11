import XCTest
import RxSwift
@testable import TMDBServices

final class MovieRequestTests: XCTestCase {
    
    public var disposableBag = DisposeBag()
    
    func testGetMovieDetailsById() throws {
        let expectation = expectation(description: "Can retrieve movie details by id")
        
        MovieService.shared.getDetails(from: 406759)
            .subscribe(onNext: { movie in
                
                XCTAssertEqual(movie.title,"Moonfall")
            
                expectation.fulfill()
            }, onError: { error in
                XCTFail(error.localizedDescription)
            }).disposed(by: disposableBag)

        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetPopularMovies() throws {
        let expectation = expectation(description: "Can retrieve popular movies list")
        
        MovieService.shared.getPopular(page: 1)
            .subscribe(onNext: { response in
                XCTAssertGreaterThan(response.results.count, 0)
                
                expectation.fulfill()
            }, onError: { error in
                XCTFail(error.localizedDescription)
            }).disposed(by: disposableBag)
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetPopularMoviesByPage() {
        let expectation = expectation(description: "Can retrieve popular movies by page")
        
        MovieService.shared.getPopular(page: 2)
            .subscribe(onNext: { response in
                XCTAssertGreaterThan(response.results.count, 0)
                XCTAssertEqual(response.page, 2)
                expectation.fulfill()
            }, onError: { error in
                XCTFail(error.localizedDescription)
            }).disposed(by: disposableBag)
        
        wait(for: [expectation], timeout: 10.0)
    }
}

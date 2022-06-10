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
}

//
//  Constants.swift
//  TMDBApp
//
//  Created by Matheus dos Reis de Jesus on 28/06/22.
//

import RxSwift
import TMDBDomain
import TMDBServices

public class Constants: ConstantsProtocol {
    
    public var apiConfiguration: APIConfiguration?
    
    private let disposeBag = DisposeBag()
    
    public static var shared: Constants = {
      return Constants()
    }()
    
    public init(apiConfiguration: APIConfiguration) {
        self.apiConfiguration = apiConfiguration
    }
    
    public init() {
        ConfigurationService.shared.getApiConfiguration().subscribe(onNext: { config in
            self.apiConfiguration = config
        }).disposed(by: disposeBag)
    }
    
    public func load() { }
}

//
//  File.swift
//  
//
//  Created by Matheus dos Reis de Jesus on 28/06/22.
//

import Foundation
import Moya
import RxSwift
import TMDBDomain

public struct ConfigurationService: ConfigurationServiceProtocol {

    let provider = MoyaProvider<ConfigurationRequest>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
    
    public static var shared: ConfigurationServiceProtocol = {
       return ConfigurationService()
    }()
    
    public func getApiConfiguration() -> Observable<APIConfiguration> {
        return Observable.create { observer in
            provider.request(.api) { result in
                switch result {
                case .success(let response):
                    do {
                        let config = try response.map(APIConfiguration.self)
                        observer.onNext(config)
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

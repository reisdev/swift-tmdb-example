//
//  File.swift
//  
//
//  Created by Matheus dos Reis de Jesus on 28/06/22.
//

import Foundation
import RxSwift

public protocol ConfigurationServiceProtocol {
    func getApiConfiguration() -> Observable<APIConfiguration>
}

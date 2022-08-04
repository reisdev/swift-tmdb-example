//
//  TMDBApp.swift
//  TMDB
//
//  Created by Matheus dos Reis de Jesus on 09/06/22.
//

import SwiftUI
import TMDBDomain
import TMDBServices

@main
struct TMDBApp: App {
    
    init() {
        Constants.shared.load()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

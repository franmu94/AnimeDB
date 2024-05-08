//
//  AnimeDBApp.swift
//  AnimeDB
//
//  Created by Fran Malo on 10/4/24.
//

import SwiftUI

@main
struct AnimeDBApp: App {
    @StateObject var animeListViewModel = AnimeListViewModel()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(animeListViewModel)
        }
    }
}

//
//  MainTabView.swift
//  AnimeDB
//
//  Created by Fran Malo on 19/4/24.
//

import SwiftUI

struct MainTabView: View {
    
    
    var body: some View {
        TabView {
            AnimeListView()
                .tabItem {
                    Label("Anime List", systemImage:  "list.dash")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage:  "heart")
                }
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(AnimeListViewModel.preview)
}

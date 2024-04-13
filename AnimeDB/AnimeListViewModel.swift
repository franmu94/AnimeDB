//
//  AnimeListViewModel.swift
//  AnimeDB
//
//  Created by Fran Malo on 11/4/24.
//

import Foundation

final class AnimeListViewModel: ObservableObject {
    
    let animeInteractor: AnimeInteractor
    var animes: [Anime] = []
    
    @Published var searchText = ""
    
    var filteredAnimes: [Anime] {
        animes.filter { anime in
            searchFilter(anime: anime)
        }
    }
    
    init(animeInteractor: AnimeInteractor = AnimeInteractor()) {
        self.animeInteractor = animeInteractor
        getAnimes()
        
    }
    
    func getAnimes() {
        do {
            self.animes = try animeInteractor.loadAnimes()
        } catch {
            print(error)
        }
    }
    
    func searchFilter(anime: Anime) -> Bool {
        if searchText.isEmpty {
            true
        } else {
            anime.title.localizedStandardContains(searchText)
        }
    }
    
   /* func sortList() -> [Anime] {
        if !searchText.isEmpty {
            animes.filter { anime in
                anime.title.localizedStandardContains(searchText)
            }
        } else {
            animes
        }
    }
    */
    
    
}






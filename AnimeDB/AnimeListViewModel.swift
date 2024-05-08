//
//  AnimeListViewModel.swift
//  AnimeDB
//
//  Created by Fran Malo on 11/4/24.
//

import Foundation

final class AnimeListViewModel: ObservableObject {
    
    let animeInteractor: AnimeInteractor
    @Published var animes: [Anime] = [] {
        didSet {
            try? animeInteractor.saveAnimes(animes: animes)
        }
    }
    
    @Published var orderedBy: OrderBy = .title
    @Published var orderedType: AnimeType = .all
    @Published var orderedGenre: AnimeGenre = .all
    @Published var orderedStatus: AnimeStatus = .all
    
    @Published var searchText = ""
    @Published var errorMesage = ""

    @Published var showAlert = false
    
    var favoritesAnimes: [Anime] {
        animes
            .filter { $0.isFavorites }
            .filter { searchFilter(anime: $0) }

    }
    
    
    var filteredAnimes: [Anime] {
        animes
            .filter { searchFilter(anime: $0)}
        
            .filter { orderedTypeAnime(anime: $0) }
            .filter({ orderedStatusAnime(anime: $0)})
            .filter({ orderedGenreAnime(anime: $0)})
        
            .sorted {orderAnimes (anime1: $0, anime2: $1)}
    }
    
    init(animeInteractor: AnimeInteractor = AnimeInteractor()) {
        self.animeInteractor = animeInteractor
        getAnimes()
        
    }
    
    func getAnimes() {
        do {
            self.animes = try animeInteractor.loadAnimes()
        } catch {
            errorMesage = error.localizedDescription
            showAlert.toggle()
        }
    }
    
    func searchFilter(anime: Anime) -> Bool {
        if searchText.isEmpty {
            true
        } else {
            anime.title.localizedStandardContains(searchText)
        }
    }
    
    func orderAnimes (anime1: Anime, anime2: Anime) -> Bool {
        switch  orderedBy {
        case .title:
            anime1.title < anime2.title
        case .titleDescendent:
            anime1.title >  anime2.title
        case .rating:
            anime1.rateStart > anime2.rateStart
        case .year:
            anime1.year > anime2.year
        case .yearDescent:
            anime1.year < anime2.year
            
        }
    }
    
    func orderedTypeAnime (anime: Anime) -> Bool {
    
        orderedType == .all ? true : orderedType == anime.type
    }
    
    func orderedStatusAnime (anime: Anime) -> Bool {
        orderedStatus == .all ? true : orderedStatus == anime.status
    }
    
    func orderedGenreAnime (anime: Anime) -> Bool {

        orderedGenre == .all ? true : anime.genres?.contains(orderedGenre) ?? true

        
        
    }

    func favoriteToggle(anime: Anime) {
        print(anime.isFavorites)
        if let index = animes.firstIndex(of: anime) {
            animes[index].isFavorites.toggle()
            
            print(animes[index])
        }

    }
    
    func removeAnime(anime: Anime) {
        
        if let index = animes.firstIndex(of: anime) {
            animes.remove(at: index)
        }
        
    }
    
    /*
    func orderedGenreAnime (anime: Anime) -> Bool {
        if let orderedGenre {
            return anime.genres?.contains(orderedGenre) ?? false
        }
        return true
    }
    
    */
    
    
    
    
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






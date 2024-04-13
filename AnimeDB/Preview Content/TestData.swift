//
//  TestData.swift
//  AnimeDB
//
//  Created by Fran Malo on 11/4/24.
//

import Foundation

struct URLTest: URLInteractorProtocol {
    var bundleURL: URL {
        Bundle.main.url(forResource: "AnimesTestAC2024", withExtension: "json")!
    }
}


extension Anime {
    static let previewAnime = Anime(
        title: "Dragon Ball Z Especial: Freezer contra el padre de Goku",
        description: "Los Saiyajin han trabajado muy duro para Freezer. Sin embargo, éste temía que algún día los Saiyajin se le rebelaran, y apareciera el Legendario Super Saiyajin. Bardock se fue con sus compañeros a conquistar el planeta Kanassa, en el cual a Bardock le dieron un golpe, el cual le permitía tener visiones del futuro, entre ellas una futura destrucción del planeta de su especie, así como de la vida y obra de su hijo Son Goku.",
        year: 1990,
        type: .ova,
        rateStart: "4.3",
        votes: 218,
        status: .finalizado,
        followers: 1249,
        episodes: 1,
        genres: [.adventures,.comedy,.drama],
        urlAnime: URL(string: "https://www3.animeflv.net/anime/dragon-ball-z-especial-1")!,
        image: URL(string: "https://www3.animeflv.net/uploads/animes/covers/1115.jpg")!,
        isFavorites: false
    )
}


extension AnimeListViewModel {
    static let preview = AnimeListViewModel(animeInteractor: AnimeInteractor(urlInteractor: URLTest()))
}


extension ContentView {
    static let preview = ContentView(vm: .preview)

}

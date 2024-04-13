//
//  AnimeInteractor.swift
//  AnimeDB
//
//  Created by Fran Malo on 11/4/24.
//

import Foundation

struct AnimeInteractor: JSONInteractorProtocol, URLInteractorProtocol{
    
    static let shared = AnimeInteractor()
    
    let urlInteractor: URLInteractorProtocol
    let bundleURL: URL
    
    init(urlInteractor: URLInteractorProtocol = URLProduction()) {
        self.urlInteractor = urlInteractor
        self.bundleURL = urlInteractor.bundleURL
    }
    
    func loadAnimes() throws -> [Anime] {
        try getJSON(url: bundleURL, type: [AnimeDTO].self).map { $0.toAnime }
    }
}

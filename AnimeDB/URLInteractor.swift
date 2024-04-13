//
//  URLInteractor.swift
//  AnimeDB
//
//  Created by Fran Malo on 11/4/24.
//

import Foundation

protocol URLInteractorProtocol {
    var bundleURL: URL { get }
}

struct URLProduction: URLInteractorProtocol {
    var bundleURL: URL {
        Bundle.main.url(forResource: "AnimesAC2024", withExtension: "json")!
    }
}



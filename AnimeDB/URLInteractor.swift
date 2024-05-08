//
//  URLInteractor.swift
//  AnimeDB
//
//  Created by Fran Malo on 11/4/24.
//

import Foundation

protocol URLInteractorProtocol {
    var bundleURL: URL { get }
    var saveURL: URL { get }
}

struct URLProduction: URLInteractorProtocol {
    var bundleURL: URL {
        Bundle.main.url(forResource: "AnimesAC2024", withExtension: "json")!
    }
    
    var saveURL: URL {
        URL.documentsDirectory.appending(path: "savedAnimes.json")
    }
}

struct URLTest: URLInteractorProtocol {
    
    var saveURL: URL {
        URL.documentsDirectory.appending(path: "AnimesTestAC2024.json")
    }
    
    var bundleURL: URL {
        Bundle.main.url(forResource: "AnimesTestAC2024", withExtension: "json")!
    }
}

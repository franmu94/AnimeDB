//
//  Anime.swift
//  AnimeDB
//
//  Created by Fran Malo on 10/4/24.
//

import Foundation

struct Anime: Codable, Hashable {
    
    let title: String
    let description: String?
    let year: Int
    let type: AnimeType
    let rateStart: String
    let votes: Int
    let status: AnimeStatus
    let followers: Int
    let episodes: Int
    let genres: [AnimeGenre]?
    let urlAnime: URL
    let image: URL
    let isFavorites: Bool
    
    
    
    
}


enum AnimeType: String, CaseIterable, Identifiable, Codable {
    var id: Self { self }
    case anime = "Anime"
    case special = "Especial"
    case ova = "OVA"
    case pelicula = "Película"
    case unknown = "All"
}
enum AnimeGenre: String, CaseIterable, Identifiable, Codable{
    var id: Self { self }
    case adventures = "Aventuras"
    case scifi = "Ciencia Ficción"
    case comedy = "Comedy"
    case history = "Historico"
    case romance = "Romance"
    case fantasy = "Fantasia"
    case shounen = "Shounen"
    case magic = "Magia"
    case sobrenatural = "Sobrenatural"
    case ecchi = "Ecchi"
    case harem = "Harem"
    case seinen = "Seinen"
    case suspense = "Suspenso"
    case drama = "Drama"
    case demons = "Demons"
    case mecha = "Mecha"
    case space = "Espacial"
    case militar = "Militar"
    case police = "Policía"
    case school = "Escolares"
    case martialArts = "Artes Marciales"
    case others = "Otros"
}

enum AnimeStatus:String, Codable {
    case finalizado = "Finalizado"
    case enEmision = "En emision"
    case proximamente = "Proximamente"
    case unknown
}

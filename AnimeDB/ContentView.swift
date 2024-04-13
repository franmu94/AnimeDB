//
//  ContentView.swift
//  AnimeDB
//
//  Created by Fran Malo on 10/4/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = AnimeListViewModel()
    var body: some View {
        
        NavigationStack{
            List {
                ForEach(vm.filteredAnimes, id: \.self){ anime in
                    NavigationLink(value: anime){
                        CellView(anime: anime)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationDestination(for: Anime.self) { anime in
                Text(anime.title)
            }
            .navigationTitle("Animes")
        }
        .searchable(text: $vm.searchText, prompt: "Search Anime")
        .animation(.smooth, value: vm.searchText)
    }
}

#Preview {
    ContentView.preview
}

//
//  ContentView.swift
//  AnimeDB
//
//  Created by Fran Malo on 10/4/24.
//

import SwiftUI

struct AnimeListView: View {
    @EnvironmentObject var vm: AnimeListViewModel
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(vm.filteredAnimes, id: \.self){ anime in
                    NavigationLink(value: anime){
                        CellView(anime: anime)
                    }
                    .swipeActions {
                        Button {
                            vm.favoriteToggle(anime: anime)
                        } label: {
                            Image(systemName: "star.fill")
                                .tint(anime.isFavorites ? .yellow : .gray)
                        }
                    }
                }
                
            }
            .listStyle(.inset)
            .navigationDestination(for: Anime.self) { anime in
                Text(anime.title)
            }
            .navigationTitle("Animes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    ToolbarFilterView()
                }
            }
        }
        .searchable(text: $vm.searchText, prompt: "Search Anime")
        .animation(.smooth, value: vm.searchText)
    }
}

#Preview {
    AnimeListView.preview
}

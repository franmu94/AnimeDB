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
                    .swipeActions (edge: .leading){
                        Button {
                            vm.favoriteToggle(anime: anime)
                        } label: {
                            Image(systemName: "star.fill")
                                .tint(anime.isFavorites ? .yellow : .gray)
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role:.destructive, action: {
                            vm.removeAnime(anime: anime)
                        }, label: {
                            Image(systemName: "trash")
                        })
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
        .refreshable {
            vm.getAnimes()
        }
        .alert(vm.errorMesage, isPresented: $vm.showAlert, actions: {
            Button {
                vm.getAnimes()
            } label: {
                Text("Try again")
            }
        })
        .searchable(text: $vm.searchText, prompt: "Search Anime")
        .animation(.smooth, value: vm.searchText)
        
    }
}

#Preview {
    AnimeListView.preview
}

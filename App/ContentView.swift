//
//  ContentView.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 11/5/23.
//

import PokemonAPI
import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        Text("어ㅏ리")
            .onAppear {
                Task {
                    do {
                        // 1로 entries count 가져와서 species 로 이름 가져오기
                        let pokedex = try await PokemonAPI().gameService.fetchPokedex(1)
                        print(pokedex.name) // kalos-mountain
                        pokedex.pokemonEntries?.forEach {
                            print($0.pokemonSpecies?.name)
                        }
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

#Preview {
    ContentView()
}

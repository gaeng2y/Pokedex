//
//  DetailColumn.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 4/1/24.
//

import PokedexKit
import PokemonAPI
import SwiftUI

struct AppDetailColumn: View {
    var region: Region?
    
    var body: some View {
        Text("테스트")
            .onAppear {
                Task {
                    // 1로 entries count 가져와서 species 로 이름 가져오기
                    let pokedex = try await PokemonAPI().gameService.fetchPokedex(1)
                    print(pokedex.name) // kalos-mountain
                    pokedex.pokemonEntries?.forEach {
                        print($0.pokemonSpecies?.name)
                    }
                }
            }
    }
}

#Preview {
    AppDetailColumn(region: .kanto)
}

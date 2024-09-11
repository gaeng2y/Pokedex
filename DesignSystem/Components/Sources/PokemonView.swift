//
//  PokemonView.swift
//  Components
//
//  Created by Kyeongmo Yang on 9/12/24.
//

import SwiftUI

struct PokemonView: View {
    let imageUrl: Optional<URL>
    let name: String
    
    var body: some View {
        VStack {
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } placeholder: {
                Image("Silhouette", bundle: .module)
            }
            
            Text(name)
        }
    }
}

#Preview {
    VStack {
        PokemonView(
            imageUrl: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/151.png"),
            name: "뮤"
        )
        
        PokemonView(
            imageUrl: URL(string: "fsadjk"),
            name: "Silhouette"
        )
    }
}

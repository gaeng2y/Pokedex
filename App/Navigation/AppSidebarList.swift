//
//  SideBAr.swift
//  Pokedex
//
//  Created by Kyeongmo Yang on 4/1/24.
//

import PokedexKit
import SwiftUI

struct AppSidebarList: View {
    @Binding var selection: Region?
    
    var body: some View {
        List(Region.allCases, selection: $selection) { region in
            NavigationLink(value: region) {
                region.label
            }
        }
        .navigationTitle("Pokedex")
    }
}

#Preview {
    NavigationSplitView {
        AppSidebarList(selection: .constant(.kanto))
    } detail: {
        Text(verbatim: "Check out that sidebar!")
    }
}

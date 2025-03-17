//
//  CreaturesListView.swift
//  CatchEmAll
//
//  Created by Carolyn Ballinger on 3/17/25.
//

import SwiftUI

struct CreaturesListView: View {
    @State var creatures = Creatures()

    var body: some View {
        NavigationStack {
            Text("Come back to fix this")
            List(creatures.creaturesArray, id: \.self) { creature in
                NavigationLink {
                    DetailView(creature: creature)
                } label: {
                    Text(creature.name.capitalized)
                        .font(.title2)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Pokemon")
        }
        .task {
            await creatures.getData()
        }
    }
}
    

#Preview {
    CreaturesListView()
}

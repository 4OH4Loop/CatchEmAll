//
//  Creatures.swift
//  CatchEmAll
//
//  Created by Carolyn Ballinger on 3/17/25.
//

import Foundation

@Observable // Will watch objects for changes so that SwiftUI will redraw the interface when needed
class Creatures {
    private struct Returned: Codable {
        var count: Int
        var next: String?
        var results: [Creature]
    }
    

    
    var urlString = "https://pokeapi.co/api/v2/pokemon/"
    var count = 0
    var creaturesArray: [Creature] = []
    
    func getData() async {
        print("🕸️We are accessing the url \(urlString)")
        // convert urlString to a special URL type
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from \(urlString)")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // Try to decode JSON data into our own data structures
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                return
            }
            Task { @MainActor in
                self.count = returned.count
                self.urlString = returned.next ?? ""
                self.creaturesArray = self.creaturesArray + returned.results
            }
        } catch {
            print("ERROR: Could not create a URL from \(urlString)")
        }
    }
}

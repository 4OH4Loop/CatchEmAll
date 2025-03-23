//
//  Creature.swift
//  CatchEmAll
//
//  Created by Carolyn Ballinger on 3/17/25.
//

import Foundation

struct Creature: Codable, Identifiable {
    let id = UUID().uuidString
    var name: String
    var url: String // url for detail
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
}

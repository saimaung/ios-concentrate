//
//  Card.swift
//  Concentration
//
//  Created by Sai Wai Maung on 2019-10-10.
//  Copyright © 2019 saimaung.github.io. All rights reserved.
//

import Foundation

// Struct is value type whereas class is reference type
struct Card {
    // FaceUp meaning the side with Emoji
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    // need static Type bound globally to get the uniqueness
    static var uniqueIdentifierFactory = 0
    
    // static is Type bound (global), not object bound
    // let card = Card().getUniqueIdentifier() won't work since it's
    // not object bound
    static func getUniqueIdentifier() -> Int {
        // Note that Card is not need in static call
        // both are static
        // TODO: generate a 32 bits random number,
        // check that it's unique globally
        uniqueIdentifierFactory += 1
        return uniqueIdentifierFactory
    }
    
    init() {
        // Note that Card. since getUniqueIdentifier() is status
        // that is Type bound instead of Object bound
        self.identifier = Card.getUniqueIdentifier()
    }
    
}

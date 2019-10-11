//
//  Concentration.swift
//  Concentration
//
//  Created by Sai Wai Maung on 2019-10-10.
//  Copyright © 2019 saimaung.github.io. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    // need global
    // NOT SET or SET
    // USE Optional
    // No cards were FaceUp = nil (NOT SET)
    // More than ONE card were FaceUp = nil (NOT SET)
    // only SET when exactly one card was FaceUp
    // in this case -> process
    var indexOfOneAndOnlyCardFaceUp: Int?

    
    init(numPairsOfCards: Int) {
        for _ in 0..<numPairsOfCards {
            let card = Card()
            // card is a struct type, thus same value
            // with different  memory addresses
            cards += [card, card]
        }
        // shuffle the card
        // If we don't shuffle the card, cards will be in the same
        // order everytime
        cards = cards.shuffled()
    }
    
    func chooseCard(at index: Int) {
        /*
        /*
         cards[index].isFaceUp ? cards[index].isFaceUp = false : cards[index].isFaceUp = true
         Results value in '? :' expression have mismatching type
         '()' and 'Bool'
         
         See StackOverflow for detailed explanation:
         https://stackoverflow.com/questions/41524938
         /result-values-in-expression-have-mismatching-types-and-bool
         */
        cards[index].isFaceUp = cards[index].isFaceUp ? false : true
        /*
        if (cards[index].isFaceUp) {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        } */
        */
        //TODO implement logic for remaining properties
        //  if the chosen card is matched, do nothing
        if !cards[index].isMatched {
            // SCENARIO 1: no other cards WERE faceUp
            //  - ACTION:
            //      1. simply flip the chosen card
            //      2. set isFaceUp = true
            
            // SCENARIO 2: two other cards WERE faceUp
            //  - ACTION: flip the other two cards faceDown
            //              this card faceUp
            //1.
            //
            //
        
            // SCENARIO 3: One card WAS faceUP
            //  - ACTION: Now TRY to match
            if let matchIndex = indexOfOneAndOnlyCardFaceUp, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyCardFaceUp = nil
            } else { // flip all cards faceDown
                // either no card or two cards were face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                // now the player chose the card
                cards[index].isFaceUp = true
                indexOfOneAndOnlyCardFaceUp = index
            }
        }
    }
}

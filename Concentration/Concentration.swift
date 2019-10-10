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
    
    init(numPairsOfCards: Int) {
        for _ in 0..<numPairsOfCards {
            let card = Card()
            // card is a struct type, thus same value
            // with different  memory addresses
            cards += [card, card]
        }
        // TODO: shuffle the card
        // If we don't shuffle the card, cards will be in the same
        // order everytime
        // cards = cards.shuffled()
    }
    
    func chooseCard(at index: Int) {
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
        
        // @TODO implement logic for remaining properties
        
    
    }
}

//
//  ViewController.swift
//  Concentration
//
//  Created by Sai Wai Maung on 2019-10-06.
//  Copyright © 2019 saimaung.github.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip Counts: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    /*
     // + 1 to make sure even number
     // 3 + 1 / 2 = 2 pairs -> round UP
     // 4 + 1 / 2 = 2.5 pairs, Swift rounds down on Int
     // In Odd case, player will never be able to match the remaining
     // card (round up),
     // but at least make sure that the app doesn't crash
     // game is a PROPERTY, we are initializing it thus
     // property initializer
     // ERROR MESSAGE: Cannot use instance member 'cardButtons' within
     // property initializer; property initializers run before 'self'
     // is available. cardButtons isn't fully initialized yet at this point
     // SOLUTION: lazy keywork to the execute
     // meaning we aren't initializing game until someone uses game
     // which is after all other initialization is done
     // lazy can't have didSet (PROPERTY OBSERVER)
    */
    lazy var game = Concentration(numPairsOfCards: (cardButtons.count + 1)
        / 2)
    
    // This is being Modeled as Identifier in Card.swift - the model class
    let cardEmojis: [String] = ["👻", "🎃", "👻", "🎃"]
    
    // @TODO: Implement emoji func
    func emoji(for card: Card) -> String {
        return "👻"
    }
    
    func updateViewFromModel() {
        // indices return COUNTABLE RANGE SEQUENCE of Int
        for index in cardButtons.indices {
            // Map (matches) button to card
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if (card.isFaceUp) {
                // if side is the one with Emoji
                flipCount += 1
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
                
            } else {
                button.setTitle("", for: UIControl.State.normal)
                // make matched card clear so that player can't see them
                // take it out of UI by making it CLEAR
                // when it MATCHED && FACEDOWN
                // when FACEUP, want player to see it's a MATCHED
                // #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                // opacity = 0 means completely TRANSPARENT
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : UIColor.systemYellow
            }
        }
    }
    
    
    @IBAction func touchButton(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            /*
             // Model change with this API
             // This is where lazy is useful above
             // we use game here and game get initialized
             // Thus Model changed since player touched the card
             // like whether matched or not etc ...
            */
            game.chooseCard(at: cardIndex)
            // TODO: Update View since the Model changed
            // func updateViewFromModel
            updateViewFromModel()
        }
        
    }
    
}


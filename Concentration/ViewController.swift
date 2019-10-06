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
    let cardEmojis: [String] = ["👻", "🎃", "👻", "🎃"]
    
    @IBAction func touchButton(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            let emoji = cardEmojis[cardIndex]
            flipCard(withEmoji: emoji, on: sender)
        }
        
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor.systemYellow
        } else {
            flipCount += 1
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = UIColor.white
        }
    }
}


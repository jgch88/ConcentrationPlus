//
//  ViewController.swift
//  Concentration
//
//  Created by JUSTIN GOH on 30/11/19.
//  Copyright © 2019 Radium Laboratories. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cards: [UIButton]!
    
    let cardSymbols = ["👻", "🎃", "👻", "🎃"]
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    };
    
    @IBAction func cardPress(_ sender: UIButton) {
        if let cardIndex = cards.firstIndex(of: sender) {
            flipCard(withEmoji: cardSymbols[cardIndex], on: sender)
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = Colours.cardBack
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = Colours.cardFront
            flipCount += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colours.background;
        for card in cards {
            card.backgroundColor = Colours.cardBack
        }
        flipCountLabel.textColor = Colours.primary
    }
}


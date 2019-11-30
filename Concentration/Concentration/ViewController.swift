//
//  ViewController.swift
//  Concentration
//
//  Created by JUSTIN GOH on 30/11/19.
//  Copyright © 2019 Radium Laboratories. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cards.count + 1) / 2) // in case number of cards is odd
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet var cards: [UIButton]!

    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    };
    
    @IBAction func cardPress(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cards.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cards")
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game.newGame()
        flipCount = 0
        updateViewFromModel()
        emojiChoices = ["👻", "🎃", "🦇", "🙀", "🍭", "😈", "💀", "👁"]
    }
    
    func updateViewFromModel() {
        for index in cards.indices {
            let button = cards[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = Colours.cardFront
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : Colours.cardBack
            }
        }
    }
    var emojiChoices = ["👻", "🎃", "🦇", "🙀", "🍭", "😈", "💀", "👁"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colours.background;
        for card in cards {
            card.backgroundColor = Colours.cardBack
        }
        flipCountLabel.textColor = Colours.primary
        newGameButton.backgroundColor = Colours.secondary
        newGameButton.setTitleColor(Colours.background, for: UIControl.State.normal)
    }
}


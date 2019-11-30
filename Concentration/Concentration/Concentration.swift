//
//  Concentration.swift
//  Concentration
//
//  Created by JUSTIN GOH on 30/11/19.
//  Copyright © 2019 Radium Laboratories. All rights reserved.
//

// The Model in MVC
import Foundation

class Concentration
{
    var cards = [Card]()
    var viewIndexOfOneAndOnlyFaceUpCard: Int?
    private var numberOfPairs: Int
    
    func chooseCard(at viewIndex: Int) {
        if !cards[viewIndex].isMatched {
            if let indexToMatch = viewIndexOfOneAndOnlyFaceUpCard, indexToMatch != viewIndex {
                // there is a face up card, check if cards match
                if cards[indexToMatch].identifier == cards[viewIndex].identifier {
                    cards[indexToMatch].isMatched = true
                    cards[viewIndex].isMatched = true
                }
                cards[viewIndex].isFaceUp = true
                viewIndexOfOneAndOnlyFaceUpCard = nil
            } else {
                // no face up cards, either no cards, or two cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[viewIndex].isFaceUp = true
                viewIndexOfOneAndOnlyFaceUpCard = viewIndex
            }
        }
    }
    
    // new game requires a derived state precondition? unmatchedCardsRemaining
    func newGame() {
        cards = [Card]()
        setupBoard(numberOfPairsOfCards: self.numberOfPairs)
    }
    
    init(numberOfPairsOfCards: Int) {
        // TODO: Shuffle the cards
        self.numberOfPairs = numberOfPairsOfCards
        setupBoard(numberOfPairsOfCards: numberOfPairsOfCards)
    }
    
    private func setupBoard(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards = cards.shuffled()
    }
}

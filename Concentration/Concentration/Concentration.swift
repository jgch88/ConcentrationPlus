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
    var score = 0
    var flipCount = 0
    var viewIndexOfOneAndOnlyFaceUpCard: Int?
    var previouslySeenCardIdentifiers = Dictionary<Int, Bool>()
    private var numberOfPairs: Int
    
    func chooseCard(at viewIndex: Int) {
        if !cards[viewIndex].isMatched {
            if let indexToMatch = viewIndexOfOneAndOnlyFaceUpCard {
                if indexToMatch != viewIndex {
                    // there is a face up card, check if cards match
                    flipCount += 1
                    if cards[indexToMatch].identifier == cards[viewIndex].identifier {
                        // matched
                        cards[indexToMatch].isMatched = true
                        cards[viewIndex].isMatched = true
                        score += 2
                    } else {
                        // didn't match
                        for previouslySeenCardIdentifier in previouslySeenCardIdentifiers.keys {
                            if previouslySeenCardIdentifiers[previouslySeenCardIdentifier] == true {
                                if previouslySeenCardIdentifier == cards[viewIndex].identifier {
                                    score -= 1
                                }
                                if previouslySeenCardIdentifier == cards[indexToMatch].identifier {
                                    score -= 1
                                }
                            }
                        }
                    }
                    cards[viewIndex].isFaceUp = true
                    viewIndexOfOneAndOnlyFaceUpCard = nil
                    // only append it if not already inside, maybe should use a dictionary of indices instead
                    previouslySeenCardIdentifiers[cards[viewIndex].identifier] = true
                    previouslySeenCardIdentifiers[cards[indexToMatch].identifier] = true
                }
            } else {
                flipCount += 1
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
        previouslySeenCardIdentifiers = Dictionary<Int, Bool>()
    }
    
    init(numberOfPairsOfCards: Int) {
        self.numberOfPairs = numberOfPairsOfCards
        setupBoard(numberOfPairsOfCards: numberOfPairsOfCards)
    }
    
    private func setupBoard(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        shuffle()
        flipCount = 0
        score = 0
    }
    
    private func shuffle() {
        cards = cards.shuffled()
        spyShuffleCount += 1
    }
    
    var spyShuffleCount = 0;
}

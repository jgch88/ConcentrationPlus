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
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards, or two cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        // TODO: Shuffle the cards
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            
//            Approach 1:
//            let matchingCard = card
//            cards.append(card)
//            cards.append(matchingCard) // this is a copy, not the same reference because it is a struct, so there are two unique cards
            
//            Approach 2:
//            cards.append(card) // appending into an array also does a copy
//            cards.append(card)
            
//            Approach 3:
            cards += [card, card]
        }
    }
}

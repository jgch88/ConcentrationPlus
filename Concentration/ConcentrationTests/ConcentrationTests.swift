//
//  ConcentrationTests.swift
//  ConcentrationTests
//
//  Created by JUSTIN GOH on 30/11/19.
//  Copyright © 2019 Radium Laboratories. All rights reserved.
//

import XCTest
@testable import Concentration

class ConcentrationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGameInitialization() {
        let numberOfPairsOfCards = 4
        let numberOfCards = numberOfPairsOfCards * 2
        let game = Concentration.init(numberOfPairsOfCards: numberOfPairsOfCards)
        
        XCTAssertEqual(game.cards.count, numberOfCards)
    }

    func testGameShufflesCards() {
        // assert game.cards.shuffled() is called, can't just do a simple spy so add a "spy" property?
        // spy variables are going to litter the class, and it isn't checking the exact method call
        // test isn't defensive enough -> Concentration can be modified that this test passes but cards aren't really shuffled
        let game = Concentration.init(numberOfPairsOfCards: 1)
        
        XCTAssertEqual(game.spyShuffleCount, 1)
    }
}

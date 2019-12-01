import XCTest
@testable import Concentration

class CardTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testCardInitialization() {
        let card = Card()
        
        XCTAssertNotNil(card.isFaceUp)
        XCTAssertNotNil(card.isMatched)
        XCTAssertNotNil(card.identifier)
    }

}

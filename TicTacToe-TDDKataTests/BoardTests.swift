//
//  BoardTests.swift
//  TicTacToe-TDDKataTests
//
//  Created by Vinicius Moreira Leal on 04/07/2020.
//  Copyright © 2020 Vinicius Moreira Leal. All rights reserved.
//

import TicTacToe_TDDKata
import XCTest

class BoardTests: XCTestCase {

    func test_init_boardHasNineSpots() {
        let sut = Board()
        XCTAssertEqual(sut.spots.count, 9)
    }

    func test_init_boardHasAllSpotsAvailable() {
        let sut = Board()
        XCTAssertTrue(sut.hasAllSpotsAvailable)
    }

    func test_board_acceptsGameInputOnAvailableSpots() {
        let sut = Board()

        sut.receive(.cross, at: 3)

        XCTAssertFalse(sut.hasAllSpotsAvailable)
        XCTAssertEqual(sut.spots[3], .cross)
    }

    func test_board_doesNotAcceptGameInputWhenSpotIsNotAvailable() {
        let sut = Board()

        sut.receive(.cross, at: 2)
        XCTAssertEqual(sut.spots[2], .cross)

        sut.receive(.nought, at: 2)
        XCTAssertEqual(sut.spots[2], .cross)
    }

    func test_reset_resetsInitialState() {
        let sut = Board()

        sut.receive(.cross, at: 2)
        XCTAssertFalse(sut.hasAllSpotsAvailable)

        sut.reset()
        XCTAssertTrue(sut.hasAllSpotsAvailable)
    }

    func test_findWinner_registersWinningMoveCorrectly() {
        let exp = expectation(description: "wait for game completion")
        var winningOption: SpotOption?
        
        let sut = Board { option in
            winningOption = option
            exp.fulfill()
        }

        sut.receive(.cross, at: 4)
        sut.receive(.nought, at: 3)
        sut.receive(.cross, at: 2)
        sut.receive(.nought, at: 5)
        sut.receive(.cross, at: 6)

        wait(for: [exp], timeout: 0.1)
        XCTAssertEqual(winningOption, .cross)
    }
}

extension Board {
    var hasAllSpotsAvailable: Bool {
        spots.allSatisfy { $0 == .none }
    }
}

//
//  BoardTests.swift
//  TicTacToe-TDDKataTests
//
//  Created by Vinicius Moreira Leal on 04/07/2020.
//  Copyright © 2020 Vinicius Moreira Leal. All rights reserved.
//

import XCTest

class Board {

    private(set) var spots: [Int]

    init() {
        spots = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }

    func receive(_ input: Int, at index: Int) {
        guard spots[index] == 0 else { return }
        spots[index] = input
    }
}

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

        sut.receive(1, at: 3)

        XCTAssertFalse(sut.hasAllSpotsAvailable)
        XCTAssertEqual(sut.spots[3], 1)
    }

    func test_board_doesNotAcceptGameInputWhenSpotIsNotAvailable() {
        let sut = Board()

        sut.receive(1, at: 2)
        XCTAssertEqual(sut.spots[2], 1)

        sut.receive(2, at: 2)
        XCTAssertEqual(sut.spots[2], 1)
    }
}

extension Board {
    var hasAllSpotsAvailable: Bool {
        spots.allSatisfy { $0 == 0 }
    }
}

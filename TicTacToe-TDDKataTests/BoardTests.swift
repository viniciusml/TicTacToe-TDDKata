//
//  BoardTests.swift
//  TicTacToe-TDDKataTests
//
//  Created by Vinicius Moreira Leal on 04/07/2020.
//  Copyright © 2020 Vinicius Moreira Leal. All rights reserved.
//

import XCTest

enum SpotOption {
    case nought
    case cross
    case none
}

class Board {

    private(set) var spots: [SpotOption]

    init() {
        spots = [SpotOption](repeating: .none, count: 9)
    }

    func receive(_ input: SpotOption, at index: Int) {
        guard spots[index] == .none else { return }
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
}

extension Board {
    var hasAllSpotsAvailable: Bool {
        spots.allSatisfy { $0 == .none }
    }
}

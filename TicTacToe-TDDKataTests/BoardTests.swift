//
//  BoardTests.swift
//  TicTacToe-TDDKataTests
//
//  Created by Vinicius Moreira Leal on 04/07/2020.
//  Copyright © 2020 Vinicius Moreira Leal. All rights reserved.
//

import XCTest

class Board {

    let spots: [Int]

    init() {
        spots = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }

}

class BoardTests: XCTestCase {

    func test_init_boardHasNineSpots() {
        let sut = Board()
        XCTAssertEqual(sut.spots.count, 9)
    }

    func test_init_boardHasAllSpotsAvailable() {
        let sut = Board()
        XCTAssertEqual(sut.spots, [0, 0, 0, 0, 0, 0, 0, 0, 0])
    }
}

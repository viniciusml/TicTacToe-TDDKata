//
//  GameTests.swift
//  TicTacToe-TDDKataTests
//
//  Created by Vinicius Moreira Leal on 04/07/2020.
//  Copyright © 2020 Vinicius Moreira Leal. All rights reserved.
//

import TicTacToe_TDDKata
import XCTest

class Game {

    let board: Board
    private(set) var isActive: Bool = false

    init(board: Board) {
        self.board = board
    }

    func start() {
        isActive = true
    }
}

class GameTests: XCTestCase {

    func test_init_isNotActive() {
        let board = Board()
        let sut = Game(board: board)

        XCTAssertFalse(sut.isActive)
    }

    func test_start_setsGameToActive() {
        let board = Board()
        let sut = Game(board: board)

        sut.start()

        XCTAssertTrue(sut.isActive)
    }
}

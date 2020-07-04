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
}

class GameTests: XCTestCase {

    func test_game_startsWithClearBoard() {
        let board = Board()
        let sut = Game(board: board)

        XCTAssertFalse(sut.isActive)
    }
}

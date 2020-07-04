//
//  GameTests.swift
//  TicTacToe-TDDKataTests
//
//  Created by Vinicius Moreira Leal on 04/07/2020.
//  Copyright © 2020 Vinicius Moreira Leal. All rights reserved.
//

import TicTacToe_TDDKata
import XCTest

class GameTests: XCTestCase {

    func test_init_isNotActive() {
        let (sut, _) = makeSUT()

        XCTAssertFalse(sut.isActive)
    }

    func test_init_playersReceiveDifferentInputOptionTypes() {
        let (sut, _) = makeSUT()

        XCTAssertNotEqual(sut.player1.spotOption, .none)
        XCTAssertNotEqual(sut.player2.spotOption, .none)
        XCTAssertNotEqual(sut.player1.spotOption, sut.player2.spotOption)
    }

    func test_start_setsGameToActive() {
        let (sut, _) = makeSUT()

        sut.start()

        XCTAssertTrue(sut.isActive)
    }

    func test_start_beginsWithOneCurrentPlayer() {
        let (sut, _) = makeSUT()

        sut.start()

        XCTAssertNotNil(sut.currentPlayer)
    }

    func test_receiveMove_storesCorrectGameMessage() {
        let (sut, board) = makeSUT()
        sut.start()

        let firstPlayer = sut.currentPlayer
        sut.receiveMove(at: 4)
        XCTAssertEqual(board.spots[4], firstPlayer?.spotOption)

        let secondPlayer = sut.currentPlayer
        sut.receiveMove(at: 3)
        XCTAssertEqual(board.spots[3], secondPlayer?.spotOption)
        XCTAssertNotEqual(firstPlayer, secondPlayer)
    }

    func test_stop_setsGameToInactiveInitialState() {
        let (sut, _) = makeSUT()

        sut.start()
        XCTAssertTrue(sut.isActive)

        sut.stop()
        XCTAssertFalse(sut.isActive)
        XCTAssertTrue(sut.board.hasAllSpotsAvailable)
    }

    // MARK: - Helpers

    private func makeSUT() -> (sut: Game, board: Board) {
        let board = Board()
        let sut = Game(board: board)
        return (sut, board)
    }
}

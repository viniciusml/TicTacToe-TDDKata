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

        XCTAssertEqual(sut.state, .stopped)
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

        XCTAssertEqual(sut.state, .started)
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
        XCTAssertEqual(sut.state, .started)

        sut.stop()
        XCTAssertEqual(sut.state, .stopped)
        XCTAssertTrue(sut.board.hasAllSpotsAvailable)
    }

    func test_winnerFound_setsGameToFinishedState() {
        let board = Board()
        let sut = Game(board: board)
        board.delegate = sut

        sut.start()

        sut.receiveMove(at: 4)
        sut.receiveMove(at: 3)
        sut.receiveMove(at: 2)
        sut.receiveMove(at: 5)
        sut.receiveMove(at: 6)

        XCTAssertEqual(sut.state, .finished)
        XCTAssertEqual(sut.winner, .cross)
    }

    // MARK: - Helpers

    private func makeSUT() -> (sut: Game, board: Board) {
        let board = Board()
        let sut = Game(board: board)
        return (sut, board)
    }
}

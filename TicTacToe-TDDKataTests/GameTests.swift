//
//  GameTests.swift
//  TicTacToe-TDDKataTests
//
//  Created by Vinicius Moreira Leal on 04/07/2020.
//  Copyright © 2020 Vinicius Moreira Leal. All rights reserved.
//

import TicTacToe_TDDKata
import XCTest

class Player {

    let spotOption: SpotOption

    init(_ option: SpotOption) {
        self.spotOption = option
    }
}

class Game {

    let board: Board
    let player1: Player
    let player2: Player
    let currentPlayer: Player?

    private(set) var isActive: Bool = false

    init(board: Board) {
        self.board = board
        self.player1 = Player(.cross)
        self.player2 = Player(.nought)
        self.currentPlayer = player1
    }

    func start() {
        isActive = true
    }

    func stop() {
        isActive = false
        board.reset()
    }
}

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

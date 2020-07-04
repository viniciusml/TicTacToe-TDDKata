//
//  Game.swift
//  TicTacToe-TDDKata
//
//  Created by Vinicius Moreira Leal on 04/07/2020.
//  Copyright © 2020 Vinicius Moreira Leal. All rights reserved.
//

import Foundation

public class Game {

    public let board: Board
    public let player1: Player
    public let player2: Player

    private(set) public var currentPlayer: Player?
    private(set) public var state: GameState = .stopped
    private(set) public var winner: Player?

    public init(board: Board) {
        self.board = board
        self.player1 = Player(.cross)
        self.player2 = Player(.nought)
        self.currentPlayer = player1
    }

    public func start() {
        state = .started
    }

    public func stop() {
        state = .stopped
        board.reset()
    }

    public func receiveMove(at index: Int) {
        guard let player = currentPlayer else { return }
        board.receive(player.spotOption, at: index)
        currentPlayer = (currentPlayer == player1) ? player2 : player1
    }
}

extension Game: WinnerDelegate {

    public func didFindWinner(with option: SpotOption) {
        state = .finished
        registerWinner(basedOn: option)
    }

    private func registerWinner(basedOn option: SpotOption) {
        winner = [player1, player2].filter { $0.spotOption == option }.first
    }
}

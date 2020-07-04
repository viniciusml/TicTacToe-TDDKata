//
//  Board.swift
//  TicTacToe-TDDKata
//
//  Created by Vinicius Moreira Leal on 04/07/2020.
//  Copyright © 2020 Vinicius Moreira Leal. All rights reserved.
//

import Foundation

public class Board {

    private(set) public var spots: [SpotOption]
    public let winnerFound: ((SpotOption) -> Void)?

    private let winningCombinations = [
        [1, 2, 3],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]]

    public init(winnerFound: ((SpotOption) -> Void)? = nil) {
        spots = [SpotOption](repeating: .none, count: 9)
        self.winnerFound = winnerFound
    }

    public func receive(_ input: SpotOption, at index: Int) {
        guard spots[index] == .none else { return }
        spots[index] = input
        findWinner()
    }

    public func reset() {
        spots = [SpotOption](repeating: .none, count: 9)
    }

    private func findWinner() {
        for combination in winningCombinations {
            if isSequence(in: combination) {
                
                let winningOption: SpotOption = isSequenceOfCrosses(in: combination) ? .cross : .nought
                winnerFound?(winningOption)
            }
        }
    }

    private func isSequence(in combination: [Int]) -> Bool {
        spots[combination[0]] != .none &&
        spots[combination[0]] == spots[combination[1]] &&
        spots[combination[1]] == spots[combination[2]]
    }

    private func isSequenceOfCrosses(in combination: [Int]) -> Bool {
        spots[combination[0]] == .cross
    }
}

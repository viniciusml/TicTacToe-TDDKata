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

    public init() {
        spots = [SpotOption](repeating: .none, count: 9)
    }

    public func receive(_ input: SpotOption, at index: Int) {
        guard spots[index] == .none else { return }
        spots[index] = input
    }
}

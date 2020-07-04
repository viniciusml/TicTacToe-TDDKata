//
//  Player.swift
//  TicTacToe-TDDKata
//
//  Created by Vinicius Moreira Leal on 04/07/2020.
//  Copyright © 2020 Vinicius Moreira Leal. All rights reserved.
//

import Foundation

public class Player: Equatable {

    public let spotOption: SpotOption

    public init(_ option: SpotOption) {
        self.spotOption = option
    }

    public static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.spotOption == rhs.spotOption
    }
}

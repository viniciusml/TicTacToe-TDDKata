//
//  WinnerDelegate.swift
//  TicTacToe-TDDKata
//
//  Created by Vinicius Moreira Leal on 04/07/2020.
//  Copyright © 2020 Vinicius Moreira Leal. All rights reserved.
//

import Foundation

public protocol WinnerDelegate: class {
    func didFindWinner(with option: SpotOption)
}

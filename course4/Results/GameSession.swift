//
//  GameSession.swift
//  course4
//
//  Created by Вячеслав Поляков on 06.09.2021.
//

import UIKit

protocol GameSessionDelegate: AnyObject {
    func addResult(_ date: Date, _ value: Int)
}

class GameSession {
    var records: [Record] = []
    var results: Int = 0
}

extension GameSession: GameSessionDelegate {

    func addResult(_ date: Date, _ value: Int) {
        let record = Record(date: date, value: value)
        records.append(record)
        print(records)
    }
    
    func beginGame(totalQuestions questions: Int) {
        self.records = []
        Game.shared.beginGame(totalQuestions: questions)
    }
    
    func endGame() {
        Game.shared.endGame()
        self.records = []
    }
}

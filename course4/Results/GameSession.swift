//
//  GameSession.swift
//  course4
//
//  Created by Вячеслав Поляков on 06.09.2021.
//

import UIKit

protocol GameSessionDelegate: AnyObject {
    func addResult(_ question: Int, _ value: Int)
}

class GameSession {
    var results: Int = 0
    var gameResults: [GameResults] = []
}

extension GameSession: GameSessionDelegate {

    func addResult(_ question: Int, _ value: Int) {
        let record = GameResults(question: question, value: value)
        gameResults.append(record)
        self.results += 1
    }
    
    func beginGame(totalQuestions questions: Int) {
        Game.shared.beginGame(totalQuestions: questions)
    }
    
    func endGame() {
        Game.shared.endGame()
    }
}

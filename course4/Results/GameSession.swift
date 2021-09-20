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
    var results: Int = 0
}

extension GameSession: GameSessionDelegate {

    func addResult(_ date: Date, _ value: Int) {
        self.results += 1
    }
    
    func beginGame(totalQuestions questions: Int) {
        Game.shared.beginGame(totalQuestions: questions)
    }
    
    func endGame() {
        Game.shared.endGame()
    }
}

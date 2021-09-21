//
//  Game.swift
//  course4
//
//  Created by Вячеслав Поляков on 02.09.2021.
//

import Foundation

struct Record: Codable {
    let date: Date
    let totalQuestions: Int
    let answerQuestions: Int
    let gameResults: [GameResults]
}

class Game {
    
    private(set) var totalQuestions: Int = 0
    private(set) var answerQuestions: Int = 0
    private(set) var records: [Record] = []
    private let careTaker = CareTaker()
    
    var gameSession: GameSession?
    
    private init () {
        records = careTaker.loadGame() ?? []
    }
    
    static let shared = Game()
    
    func beginGame(totalQuestions questions: Int) {
        self.answerQuestions = 0
        self.totalQuestions = questions
    }
    
    func endGame() {
        if let gameSessionResults = gameSession {
            self.answerQuestions = gameSessionResults.results
            let record = Record(date: Date(), totalQuestions: self.totalQuestions, answerQuestions: self.answerQuestions, gameResults: gameSessionResults.gameResults)
            addRecord(record)
            careTaker.saveGame(records: records)
            
        }
    }
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecord() {
        self.records = []
        answerQuestions = 0
    }

}

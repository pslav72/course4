//
//  Game.swift
//  course4
//
//  Created by Вячеслав Поляков on 02.09.2021.
//

import Foundation

struct Record {
    let date: Date
    let value: Int
}

class Game {
    
    private(set) var totalQuestions: Int = 0
    private(set) var answerQuestions: Int = 0
    private(set) var records: [Record] = []
    
    var gameSession: GameSession?
    
    private init () {}
    
    static let shared = Game()
    
    func beginGame(totalQuestions questions: Int) {
        self.records = []
        self.answerQuestions = 0
        self.totalQuestions = questions
    }
    
    func endGame() {
        if let gameSessionRecords = gameSession?.records {
            self.records = gameSessionRecords
            self.answerQuestions = gameSessionRecords.count
        }
    }
    
    func addRecord(_ record: Record) {
        self.records.append(record)
        self.answerQuestions += 1
    }
    
    func clearRecord() {
        self.records = []
        answerQuestions = 0
    }

}

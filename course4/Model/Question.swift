//
//  Question.swift
//  course4
//
//  Created by Вячеслав Поляков on 28.08.2021.
//

import Foundation

struct Question {
    let question: String
    let answer: [Answer]
}

struct Answer {
    let variant: String
    let correct: Bool
}

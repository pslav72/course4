//
//  Question.swift
//  course4
//
//  Created by Вячеслав Поляков on 28.08.2021.
//

import Foundation

struct Question: Codable {
    let question: String
    let answer: [Answer]
}

struct Answer: Codable {
    let variant: String
    let correct: Bool
}

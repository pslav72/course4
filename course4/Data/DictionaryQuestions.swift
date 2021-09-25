//
//  questions.swift
//  course4
//
//  Created by Вячеслав Поляков on 24.09.2021.
//

import Foundation

class DictionaryQuestions {
    
    func putQuestions() -> [Question] {
        let questions: [Question] = [
            Question(question: "Сколько 2+2",
                     answer: [
                        Answer(variant: "1", correct: false),
                        Answer(variant: "3", correct: false),
                        Answer(variant: "4", correct: true),
                        Answer(variant: "5", correct: false),
                     ]),
            Question(question: "Сколько 2+1",
                     answer: [
                        Answer(variant: "1", correct: false),
                        Answer(variant: "3", correct: true),
                        Answer(variant: "4", correct: false),
                        Answer(variant: "5", correct: false),
                     ]),
            Question(question: "Сколько 2+5",
                     answer: [
                        Answer(variant: "1", correct: false),
                        Answer(variant: "3", correct: false),
                        Answer(variant: "7", correct: true),
                        Answer(variant: "5", correct: false),
                     ])
        ]

        return questions
    }
}

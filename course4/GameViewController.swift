//
//  GameViewController.swift
//  course4
//
//  Created by Вячеслав Поляков on 28.08.2021.
//

import UIKit

//protocol QuestionViewDelegate: AnyObject {
//    func addResult(_ date: Date, _ value: Int)
//}
//
protocol QuestionViewResultDelegate: AnyObject {
    func didEndGame(_ scene: GameViewController, withResult result: Int)
}

class GameViewController: UIViewController {
    let checkBox = CheckBox()
    let uncheckedImage = UIImage(systemName: "circle")
    var gameSession = GameSession()
    
//    weak var questionViewDelegate: QuestionViewDelegate?
    weak var questionViewResultDelegate: QuestionViewResultDelegate?
    
    weak var gameSessionDelegate: GameSessionDelegate?
    
    private var didEndGame: Bool = true
    
    var question: [Question] = [
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
    
    var questionIndex: Int = 0
    
    @IBOutlet weak var answerRadioButtom1: CheckBox!
    @IBOutlet weak var answerRadioButtom2: CheckBox!
    @IBOutlet weak var answerRadioButtom3: CheckBox!
    @IBOutlet weak var answerRadioButtom4: CheckBox!
    
    @IBOutlet weak var answerLabel1: UILabel!
    @IBOutlet weak var answerLabel2: UILabel!
    @IBOutlet weak var answerLabel3: UILabel!
    @IBOutlet weak var answerLabel4: UILabel!
    
    var answerLabels: [UILabel] = [UILabel]()
    var answerRadioButtoms: [UIButton] = [UIButton]()
    
    
    @IBAction func answerRadioButtomUpInside1(_ sender: UIButton) {
    }
    
    @IBAction func answerRadioButtomUpInside2(_ sender: UIButton) {
    }
    
    @IBAction func answerRadioButtomUpInside3(_ sender: UIButton) {
    }
    
    @IBAction func answerRadioButtomUpInside4(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButtom: UIButton!
    
    
    @IBAction func answerButtonTouchDown(_ sender: Any) {
        didEndGame = true
        zip(answerRadioButtoms, question[questionIndex].answer).forEach{
            if $0.isSelected, $1.correct {
                didEndGame = false
                clearRadioButtoms()
                questionIndex += 1
                self.gameSessionDelegate?.addResult(questionIndex, 1)
                if questionIndex <= question.count - 1 {
                    showQuestion(questionIndex)
                } else {
                    endGame()
                }
            }
        }
        if didEndGame {
            endGame()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answerLabels = [self.answerLabel1, self.answerLabel2, self.answerLabel3, self.answerLabel4]
        self.answerRadioButtoms = [self.answerRadioButtom1,self.answerRadioButtom2,self.answerRadioButtom3,self.answerRadioButtom4]
        answerRadioButtom1.alternateButton = [answerRadioButtom2!,answerRadioButtom3!,answerRadioButtom4!]
        answerRadioButtom2.alternateButton = [answerRadioButtom1!,answerRadioButtom3!,answerRadioButtom4!]
        answerRadioButtom3.alternateButton = [answerRadioButtom1!,answerRadioButtom2!,answerRadioButtom4!]
        answerRadioButtom4.alternateButton = [answerRadioButtom1!,answerRadioButtom2!,answerRadioButtom3!]
        showQuestion(questionIndex)
        gameSessionDelegate = gameSession
        Game.shared.gameSession = gameSession
        gameSession.beginGame(totalQuestions: question.count)
    }
    
    private func showQuestion(_ index: Int) {
        questionLabel.text = question[index].question
        let countAnswer = question[index].answer.count - 1
        (0...countAnswer).forEach { indexAnswer in
            answerLabels[indexAnswer].text = question[index].answer[indexAnswer].variant
        }
    }
    
    private func clearRadioButtoms() {
        let answerRadioButtoms: [CheckBox] = [answerRadioButtom1!,answerRadioButtom2!,answerRadioButtom3!]
        checkBox.alternateButton = answerRadioButtoms
        checkBox.unselectAlternateButtons()
    }
    
    private func endGame() {
        gameSession.endGame()
        self.questionViewResultDelegate?.didEndGame(self, withResult: questionIndex)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

//
//  GameViewController.swift
//  course4
//
//  Created by Вячеслав Поляков on 28.08.2021.
//

import UIKit

protocol QuestionViewResultDelegate: AnyObject {
    func didEndGame(_ scene: GameViewController, withResult result: Int)
}

class GameViewController: UIViewController {
    
    let checkBox = CheckBox()
    let uncheckedImage = UIImage(systemName: "circle")
    var gameSession = GameSession()
    private let careTaker = CareTaker()
    private let dictionaryQuestions = DictionaryQuestions()
    
    weak var questionViewResultDelegate: QuestionViewResultDelegate?
    
    weak var gameSessionDelegate: GameSessionDelegate?
    
    private var didEndGame: Bool = true
    
    var questions: [Question] = []
    
    var questionIndex = Observable<Int>(0)
    
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
    
    
    @IBOutlet weak var headerLabal: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButtom: UIButton!
    
    
    @IBAction func answerButtonTouchDown(_ sender: Any) {
        didEndGame = true
        zip(answerRadioButtoms, questions[questionIndex.value].answer).forEach{
            if $0.isSelected, $1.correct {
                didEndGame = false
                clearRadioButtoms()
                questionIndex.value += 1
                self.gameSessionDelegate?.addResult(questionIndex.value, 1)
                if questionIndex.value <= questions.count - 1 {
                    showQuestion(questionIndex.value)
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
        
        questions = dictionaryQuestions.putQuestions()
        
        if let loadQuestions = careTaker.loadQuestions() {
            questions += loadQuestions
        }
        
        print("Begin game, use difficulty \(Game.shared.difficulty)")
        if Game.shared.difficulty == .hard {
            self.questions = questions.shuffled()
        }
        
        questionIndex.addObserver(self, options: [.initial, .new]) { value, _ in
            self.headerLabal.text = "Вопрос: \(value+1)/\(self.questions.count)."
        }
        
        self.answerLabels = [self.answerLabel1, self.answerLabel2, self.answerLabel3, self.answerLabel4]
        self.answerRadioButtoms = [self.answerRadioButtom1,self.answerRadioButtom2,self.answerRadioButtom3,self.answerRadioButtom4]
        answerRadioButtom1.alternateButton = [answerRadioButtom2!,answerRadioButtom3!,answerRadioButtom4!]
        answerRadioButtom2.alternateButton = [answerRadioButtom1!,answerRadioButtom3!,answerRadioButtom4!]
        answerRadioButtom3.alternateButton = [answerRadioButtom1!,answerRadioButtom2!,answerRadioButtom4!]
        answerRadioButtom4.alternateButton = [answerRadioButtom1!,answerRadioButtom2!,answerRadioButtom3!]
        showQuestion(questionIndex.value)
        gameSessionDelegate = gameSession
        Game.shared.gameSession = gameSession
        gameSession.beginGame(totalQuestions: questions.count)
    }
    
    private func showQuestion(_ index: Int) {
        questionLabel.text = questions[index].question
        let countAnswer = questions[index].answer.count - 1
        (0...countAnswer).forEach { indexAnswer in
            answerLabels[indexAnswer].text = questions[index].answer[indexAnswer].variant
        }
    }
    
    private func clearRadioButtoms() {
        let answerRadioButtoms: [CheckBox] = [answerRadioButtom1!,answerRadioButtom2!,answerRadioButtom3!]
        checkBox.alternateButton = answerRadioButtoms
        checkBox.unselectAlternateButtons()
    }
    
    private func endGame() {
        gameSession.endGame()
        self.questionViewResultDelegate?.didEndGame(self, withResult: questionIndex.value)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

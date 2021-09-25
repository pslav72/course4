//
//  AddQuestionViewController.swift
//  course4
//
//  Created by Вячеслав Поляков on 23.09.2021.
//

import UIKit

class AddQuestionViewController: UIViewController
{
    private var answerTextField: [UITextField] = []
    private var answerCheckBox: [CheckBox] = []
    private var isAnswer: Bool = false
    private var questions: [Question] = []
    private var answers: [Answer] = []
    private let careTaker = CareTaker()
    private let checkValue = CheckValue()
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answer1TextField: UITextField!
    @IBOutlet weak var answer2TextField: UITextField!
    @IBOutlet weak var answer3TextField: UITextField!
    @IBOutlet weak var answer4TextField: UITextField!
    
    @IBOutlet weak var answer1CheckBox: CheckBox!
    @IBOutlet weak var answer2CheckBox: CheckBox!
    @IBOutlet weak var answer3CheckBox: CheckBox!
    @IBOutlet weak var answer4CheckBox: CheckBox!
    
    @IBOutlet weak var addQuestionButton: UIButton!
    
    @IBAction func addQuestionTouchDownButton(_ sender: Any) {
        
        guard let questionText = questionTextField.text else {
            pushAlert("Error", "Не задан вопрос")
            return
        }
        
        if questionText.isEmpty {
            pushAlert("Error", "Не задан вопрос")
            return
        }
        
        let _ = zip(answerTextField, answerCheckBox).map{
            isAnswer = $1.isChecked ? $1.isChecked : isAnswer
            
            guard let answersText = $0.text else {
                pushAlert("Error", "Не задан вариант ответа")
                return
            }
            
            if answersText.isEmpty {
                pushAlert("Error", "Не задан вариант ответа")
                return
            }
            else {
                answers.append(Answer(variant: answersText, correct: $1.isChecked))
            }
        }
        
        if !isAnswer {
            pushAlert("Error", "Не задан верный ответ")
        }

        if isAnswer, answers.count == 4, !questionText.isEmpty {
            questions.append(Question(question: questionText, answer: answers))
            careTaker.saveQuestions(records: questions)
        } else {
            answers.removeAll()
            pushAlert("Error", "Недостаточно данных")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.answerTextField = [self.answer1TextField, self.answer2TextField, self.answer3TextField, self.answer4TextField]
        self.answerCheckBox = [self.answer1CheckBox,self.answer2CheckBox,self.answer3CheckBox,self.answer4CheckBox]
        
        answer1CheckBox.alternateButton = [answer2CheckBox!,answer3CheckBox!,answer4CheckBox!]
        answer2CheckBox.alternateButton = [answer1CheckBox!,answer3CheckBox!,answer4CheckBox!]
        answer3CheckBox.alternateButton = [answer1CheckBox!,answer2CheckBox!,answer4CheckBox!]
        answer4CheckBox.alternateButton = [answer1CheckBox!,answer2CheckBox!,answer3CheckBox!]
    }
    
    func pushAlert ( _ title: String, _ message: String) {
        let alter = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }
    
}

//
//  ViewController.swift
//  course4
//
//  Created by Вячеслав Поляков on 27.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var settingsButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsLabel.text = "Правильных ответов 0"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameSegue" {
            guard let vc = segue.destination as? GameViewController else { return }
            vc.questionViewResultDelegate = self
        }
    }
}

extension ViewController: QuestionViewResultDelegate {
    func didEndGame(_ scene: GameViewController, withResult result: Int) {
        let results = "Правильных ответов \(Game.shared.answerQuestions)"
        self.resultsLabel.text = results
    }
}

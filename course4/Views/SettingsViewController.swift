//
//  SettingsViewController.swift
//  course4
//
//  Created by Вячеслав Поляков on 23.09.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var difficultySegmentControl: UISegmentedControl!
    
    @IBOutlet weak var backMainMenuButtom: UIButton!
    
    @IBAction func backMainMenuTochDownButtom(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Default difficulty \(Game.shared.difficulty)")
        difficultySegmentControl.addTarget(self, action: #selector(touchDownSegmentControl(_:)), for: .valueChanged)
    }
    
    @objc private func touchDownSegmentControl(_ sender: UISegmentedControl) {
        var difficulty: Difficulty {
            switch sender.selectedSegmentIndex {
            case 0:
                return .normal
            case 1:
                return .hard
            default:
                return .normal
            }
        }
        Game.shared.setDifficulty(difficulty)
    }
    
}

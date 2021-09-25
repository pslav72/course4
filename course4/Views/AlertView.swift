//
//  AlertView.swift
//  course4
//
//  Created by Вячеслав Поляков on 24.09.2021.
//

import UIKit

class AlertView: AddQuestionViewController {
    
    func push ( _ title: String, _ message: String) {
        // Создаем контроллер
        let alter = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alter.addAction(action)
        // Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }
    
}

//
//  CheckValue.swift
//  course4
//
//  Created by Вячеслав Поляков on 24.09.2021.
//

import UIKit

class CheckValue {
    
    func checkAnswerText(from field: UITextField) -> Bool {
        
        guard let fieldText = field.text else {
            return false
        }
        
        if !fieldText.isEmpty,
           fieldText.count > 0 {
            return true
        }
        
        return false
        
    }
}

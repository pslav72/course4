//
//  CheckBox.swift
//  course4
//
//  Created by Вячеслав Поляков on 31.08.2021.
//

import UIKit

class CheckBox: UIButton {
    var alternateButton:Array<CheckBox>?
    // Images
    let checkedImage = UIImage(systemName: "circle.fill")
    let uncheckedImage = UIImage(systemName: "circle")
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
                self.isSelected = true
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
                self.isSelected = false
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func buttonClicked(sender: UIButton) {
        unselectAlternateButtons()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    func unselectAlternateButtons() {
        if alternateButton != nil {
            self.isChecked = true
            
            for aButton:CheckBox in alternateButton! {
                aButton.isChecked = !isChecked
            }
        } else {
            toggleButton()
        }
    }
    
    func toggleButton() {
        self.isChecked = !isChecked
    }
}

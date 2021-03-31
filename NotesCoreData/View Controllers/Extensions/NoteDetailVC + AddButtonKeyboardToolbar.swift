//
//  NoteDetailVC + AddButtonKeyboardToolbar.swift
//  NotesCoreData
//
//  Created by Mikhail on 25.03.2021.
//

import UIKit

// MARK: - AddButtonKeyboardToolbar
extension NoteDetailTableViewController {

func addDoneButtonTo() {
    let keyboardToolbar = UIToolbar()
    let doneButton = UIBarButtonItem(title:"Done", style: .done,
                                     target: self, action: #selector(didTapDone))
    
    let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: nil, action: nil)
    
    keyboardToolbar.setItems([flexBarButton, doneButton], animated: true)
    keyboardToolbar.sizeToFit()
    
    noteDetailTextView.inputAccessoryView = keyboardToolbar
    noteNameTextField.inputAccessoryView = keyboardToolbar
}

@objc private func didTapDone() {
    view.endEditing(true)
}
}

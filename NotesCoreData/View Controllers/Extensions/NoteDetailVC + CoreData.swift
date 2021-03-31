//
//  NoteDetailVC + CoreData.swift
//  NotesCoreData
//
//  Created by Mikhail on 25.03.2021.
//

import Foundation
import CoreData

// MARK: - Core data
extension NoteDetailTableViewController {
    
    func updateNote(note: Notes) {
        note.name = noteNameTextField.text
        note.detail = noteDetailTextView.text
        if let imageData = noteImageDetail.image?.jpegData(compressionQuality: 1) {
            note.image = imageData
            do {
                try context.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    func createNote() {
        let newNote = Notes(context: context)
        newNote.name = noteNameTextField.text
        newNote.detail = noteDetailTextView.text
        if let imageData = noteImageDetail.image?.jpegData(compressionQuality: 1) {
            newNote.image = imageData
        }
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

//
//  NoteTableVC + CoreData.swift
//  NotesCoreData
//
//  Created by Mikhail on 25.03.2021.
//

import Foundation
import CoreData

// MARK: - Core data
extension NotesTableViewController {
    
    func getAllNotes() {
        do {
            allNotes = try context.fetch(Notes.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func deleteNote(note: Notes) {
        context.delete(note)
        do {
            try context.save()
            getAllNotes()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}


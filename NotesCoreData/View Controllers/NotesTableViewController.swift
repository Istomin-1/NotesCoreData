//
//  NotesTableViewController.swift
//  NotesCoreData
//
//  Created by Mikhail on 22.03.2021.
//

import UIKit
import CoreData


class NotesTableViewController: UITableViewController {
    
    // MARK: - Properties
    var allNotes: [Notes] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllNotes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        
        return allNotes.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell",
                                                 for: indexPath) as! NoteTableViewCell
        
        let note = allNotes[indexPath.row]
        cell.noteNameLabel.text = note.name
        cell.noteDetailLabel.text = note.detail
        if let imageData = note.image {
            if let imageNote = UIImage(data: imageData) {
                cell.noteImage.image = imageNote
            }
        } else {
            cell.noteImage.image = nil
        }
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = allNotes[indexPath.row]
            deleteNote(note: task)
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let noteViewController = segue.destination as! NoteDetailTableViewController
        
        if segue.identifier == "editNote" {
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedNote = allNotes[indexPath.row]
            noteViewController.note = selectedNote
            noteViewController.context = context
        } else if segue.identifier == "addNote" {
            noteViewController.context = self.context
        }
    }
    
    @IBAction func unwindNotes(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        let sourceViewController = segue.source as! NoteDetailTableViewController
        
        if let note = sourceViewController.note {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                allNotes[selectedIndexPath.row] = note
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: allNotes.count, section: 0)
                allNotes.append(note)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
}

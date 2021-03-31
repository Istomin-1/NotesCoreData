//
//  NoteDetailTableViewController.swift
//  NotesCoreData
//
//  Created by Mikhail on 22.03.2021.
//

import UIKit
import CoreData

class NoteDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    var note: Notes!
    var context: NSManagedObjectContext!
    private var imageIndexPath = IndexPath(row: 1, section: 2)
    
    // MARK: - Outlets
    @IBOutlet var noteNameTextField: UITextField!
    @IBOutlet var noteDetailTextView: UITextView!
    @IBOutlet var noteImageDetail: UIImageView!
    @IBOutlet var saveButtonItem: UIBarButtonItem!
    
    // MARK: - Lifecicle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateSaveButtonState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editNote()
        addDoneButtonTo()
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath == imageIndexPath { return nil }
        
        return indexPath
    }
    
    // MARK: - Action funcs
    @IBAction func addImageButton(_ sender: UIButton) {
        showAllertAddImage(title: "Choose Image Source", message: nil)
    }
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    // MARK: - Private funcs
    private func editNote() {
        guard let note = note else { return }
        navigationItem.title = "Edit note"
        noteNameTextField.text = note.name
        noteDetailTextView.text = note.detail
        if let imageData = note.image {
            if let imageNote = UIImage(data: imageData) {
                noteImageDetail.image = imageNote
            }
        }
    }
    
    private func updateSaveButtonState() {
        if navigationItem.title == "New note" {
            let text = noteNameTextField.text ?? ""
            saveButtonItem.isEnabled = !text.isEmpty
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "saveSegue" else { return }
        if navigationItem.title == "New note" {
            createNote()
        } else {
            updateNote(note: note)
        }
    }
}



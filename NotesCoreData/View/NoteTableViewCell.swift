//
//  NoteTableViewCell.swift
//  NotesCoreData
//
//  Created by Mikhail on 22.03.2021.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet var noteNameLabel: UILabel!
    @IBOutlet var noteDetailLabel: UILabel!
    @IBOutlet var noteImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        noteImage.layer.cornerRadius = 5
    }
    
    }

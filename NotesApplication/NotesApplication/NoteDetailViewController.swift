//
//  NoteDetailViewController.swift
//  NotesApplication
//
//  Created by Ryan Burns on 11/14/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var textTextView: UITextView!
	
	var note: Note!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.note = Note()
		let appDelegate = AppDelegate.GetInstance()
		appDelegate.addNote(note: self.note)
	}

	@IBAction func noteTitleChanged(_ sender: AnyObject) {
		
		self.note.title = self.titleTextField.text!
	}
}

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
		
		if self.note == nil
		{
			self.note = Note()
			let appDelegate = AppDelegate.GetInstance()
			appDelegate.addNote(note: self.note)
		}
		
		// Set up views with note data
		self.titleTextField.text = self.note.title
		self.textTextView.text = self.note.text
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		
		self.note.title = self.titleTextField.text!
		self.note.text = self.textTextView.text
	}
}

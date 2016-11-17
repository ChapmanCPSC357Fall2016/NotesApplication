//
//  ViewController.swift
//  NotesApplication
//
//  Created by Ryan Burns on 11/14/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
	
	@IBOutlet weak var notesTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.notesTableView.dataSource = self
	}
	
	override func viewDidAppear(_ animated: Bool) {
		
		self.notesTableView.reloadData()
	}
	
	func getNotes() -> [Note]
	{
		// get app delegate
		let appDelegate = AppDelegate.GetInstance()
		let notes = appDelegate.notes
		
		return notes
	}
}

extension NotesViewController: UITableViewDataSource
{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		print("numberOfRowsInSection")
		
		let notes = getNotes()
		return notes.count
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		print("Trying to load cell #\(indexPath.row)")
		
		// get the note at that position
		let notes = getNotes()
		let note = notes[indexPath.row]
		
		// make a cell
		let cell = UITableViewCell()
		cell.textLabel!.text = note.title
		
		return cell
	}
}


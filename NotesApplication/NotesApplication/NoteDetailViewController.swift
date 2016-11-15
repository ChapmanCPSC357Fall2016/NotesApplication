//
//  NoteDetailViewController.swift
//  NotesApplication
//
//  Created by Ryan Burns on 11/14/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		print("B: viewDidLoad")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		print("B: viewWillAppear")
	}
	
	override func viewDidAppear(_ animated: Bool) {
		print("B: viewDidAppear")
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		print("B: viewWillDisappear")
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		print("B: viewDidDisappear")
	}
}

//
//  ViewController.swift
//  NotesApplication
//
//  Created by Ryan Burns on 11/14/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		print("A: viewDidLoad")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		print("A: viewWillAppear")
	}
	
	override func viewDidAppear(_ animated: Bool) {
		print("A: viewDidAppear")
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		print("A: viewWillDisappear")
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		print("A: viewDidDisappear")
	}
}


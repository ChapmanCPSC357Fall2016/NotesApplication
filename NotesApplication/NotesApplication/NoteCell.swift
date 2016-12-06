//
//  NoteCell.swift
//  NotesApplication
//
//  Created by Ryan Burns on 12/5/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var seeMapButton: UIButton!
	
	var note: Note!
	var navController: UINavigationController!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func populate(note: Note, navController: UINavigationController)
	{
		self.note = note
		self.navController = navController
		
		self.titleLabel.text = note.text
		
		if note.location == nil
		{
			self.seeMapButton.isHidden = true
		}
	}
	
	@IBAction func seeMapTapped(_ sender: AnyObject) {
		
		let mapVC = UIStoryboard.InstantiateViewController(withIdentifier: "map_view") as! NoteMapViewController
		mapVC.note = self.note
		
		self.navController.pushViewController(mapVC, animated: true)
	}
}

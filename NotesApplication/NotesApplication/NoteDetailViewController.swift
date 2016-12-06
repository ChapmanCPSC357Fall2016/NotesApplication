//
//  NoteDetailViewController.swift
//  NotesApplication
//
//  Created by Ryan Burns on 11/14/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit
import CoreLocation

class NoteDetailViewController: UIViewController {
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var textTextView: UITextView!
	@IBOutlet weak var seeMapButton: UIBarButtonItem!
	
	var note: Note!
	var locationManager: CLLocationManager!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if self.note == nil
		{
			self.note = Note()
			let appDelegate = AppDelegate.GetInstance()
			appDelegate.addNote(note: self.note)
			
			locationManager = CLLocationManager()
			
			locationManager.delegate = self
			locationManager.requestWhenInUseAuthorization()
		}
		
		// Set up views with note data
		self.titleTextField.text = self.note.title
		self.textTextView.text = self.note.text
		if self.note.location == nil
		{
			self.seeMapButton.isEnabled = false
		}
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		
		self.note.title = self.titleTextField.text!
		self.note.text = self.textTextView.text
		
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if let mapVC = segue.destination as? NoteMapViewController
		{
			mapVC.note = self.note
		}
	}
}

extension NoteDetailViewController: CLLocationManagerDelegate
{
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		
		if status == CLAuthorizationStatus.authorizedWhenInUse
		{
			self.locationManager.requestLocation()
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		
		print("Location updates failed with error: \(error.localizedDescription)")
		
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
		
		let location = locations.first!
		print("Got new location! (\(location.coordinate.latitude),\(location.coordinate.longitude))")
		self.note.location = location
		self.seeMapButton.isEnabled = true
	}
}

//
//  NoteMapViewController.swift
//  NotesApplication
//
//  Created by Ryan Burns on 11/30/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit
import MapKit

class NoteMapViewController: UIViewController {

	@IBOutlet weak var mapView: MKMapView!
	var note: Note!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		let annotation = MKPointAnnotation()
		annotation.coordinate = self.note!.location!.coordinate
		
		self.mapView.addAnnotation(annotation)
		
		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		let region = MKCoordinateRegion(center: self.note!.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
		
		self.mapView.setRegion(region, animated: true)
	}
}

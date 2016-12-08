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

	@IBOutlet weak var weatherView: UIView!
	@IBOutlet weak var tempLabel: UILabel!
	@IBOutlet weak var mapView: MKMapView!
	var note: Note!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		let annotation = MKPointAnnotation()
		annotation.coordinate = self.note!.location!.coordinate
		
		self.mapView.addAnnotation(annotation)
		
		
		self.weatherView.alpha = 0
		self.getWeather()
		
		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		let region = MKCoordinateRegion(center: self.note!.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
		
		self.mapView.setRegion(region, animated: true)
	}
	
	private func getWeather()
	{
		// http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=1a917c08876fba7a288b0989bcaf6d50&units=imperial
		
		let appId = "1a917c08876fba7a288b0989bcaf6d50"
		let lat = self.note.location!.coordinate.latitude
		let long = self.note.location!.coordinate.longitude
		let unitSpec = "imperial"
		
		let baseUrl = "http://api.openweathermap.org/data/2.5"
		let method = "/weather"
		
		let fullUrl = "\(baseUrl)\(method)?lat=\(lat)&lon=\(long)&appid=\(appId)&units=\(unitSpec)"
		let url = URL(string: fullUrl)!
		
		let weatherTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
			
			if let e = error
			{
				print(e)
				return
			}
			
			let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
			let weatherDict = json as! [String: AnyObject]
			
			let temp = weatherDict["main"]!["temp"]!
			
			UIView.animate(withDuration: 1.0, animations: {
				self.weatherView.alpha = 1
				self.tempLabel.text = "\(temp!)"
			})
			
		}
		weatherTask.resume()
	}
}

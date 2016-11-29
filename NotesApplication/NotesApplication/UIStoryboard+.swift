//
//  UIStoryboard+.swift
//  NotesApplication
//
//  Created by Ryan Burns on 11/28/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard
{
	class func InstantiateViewController(withIdentifier ident: String) -> UIViewController
	{
		// Get a reference to the storyboard
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		// Get a reference to the view controller
		let vc = storyboard.instantiateViewController(withIdentifier: ident)
		
		return vc
	}
}

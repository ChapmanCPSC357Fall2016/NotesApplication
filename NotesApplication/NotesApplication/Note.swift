
import Foundation

class Note
{
	private var _title: String
	var title: String {
		get {
			return _title
		}
		set {
			_title = newValue
		}
	}
	
	private var _text: String
	var text: String {
		get {
			return _text
		}
		set {
			_text = newValue
		}
	}
	
	private var _created: Date
	// read-only
	var created: Date {
		
		return _created
	}
	
	
	init()
	{
		self._title = ""
		self._text = ""
		self._created = Date() // set date to today
	}
}

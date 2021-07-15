//
//  eventDetailsViewController.swift
//  Gay City
//
//  Created by Ian Fahning on 6/26/21.
//
import Foundation
import UIKit

class EventDetailsViewController: ViewController{
    @IBOutlet var eventTitleTextView: UILabel!
    @IBOutlet var eventStartTimeAndDateTextView: UILabel!
    @IBOutlet var eventBodyTextView: UILabel!
    
    @IBOutlet var registerNowButton: UIButton!
    
    private var eventTitle: String = "-"
    private var eventStartTimeAndDate: String = "-"
    private var eventBody: String = "-"
    private var eventLink: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTitleTextView.text = eventTitle
        eventStartTimeAndDateTextView.text  = eventStartTimeAndDate
        eventBodyTextView.attributedText = eventBody.htmlToAttributedString
    }
    
    
    func configure(eventTitle: String, eventStartTimeAndDate: String, eventBody: String, eventLink: String){
        self.eventTitle = eventTitle
        self.eventStartTimeAndDate = eventStartTimeAndDate
        self.eventBody = eventBody
        self.eventLink = eventLink
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let nextViewController = segue.destination as? EventWebView
        {
            nextViewController.url = eventLink
        }
    }
    
}


extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}



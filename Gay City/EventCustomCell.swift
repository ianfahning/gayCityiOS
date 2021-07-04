//
//  File.swift
//  Gay City
//
//  Created by Ian Fahning on 6/26/21.
//

import Foundation
import UIKit

class EventCustomCell: UITableViewCell{
    
    @IBOutlet var eventTitle: UILabel!
    @IBOutlet var eventStartDate: UILabel!
    @IBOutlet var eventStartTime: UILabel!
    
    
    func configure(eventTitle: String, eventStartDate: String, eventStartTime: String){
        self.eventTitle.text = eventTitle
        self.eventStartDate.text = eventStartDate
        self.eventStartTime.text = eventStartTime
    }

}

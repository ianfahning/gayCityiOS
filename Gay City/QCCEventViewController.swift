//
//  QCCEventViewController.swift
//  Gay City
//
//  Created by Ian Fahning on 7/2/21.
//

import UIKit
import Foundation

class QCCEventViewController: ViewController{
    
    
    @IBOutlet var loadingSymbol: UIActivityIndicatorView!
    private var isDone = false
    private var eventData: [EventData] = []
    @IBOutlet var tableView: UITableView!
    
    
    struct EventData: Codable{
        var ID: Int
        var data: MecData
        var date: Date
    }
    
    struct MecData: Codable{
        var ID: Int
        var title: String
        var content: String
        var post: Post
        var meta: Meta
        var mec: Mec
        var time: Time
        //var hourly_schedules: [String]
        //var tickets: [String]
       // var color: String
        var permalink: String
       // var thumnails: Thumbnails
     //   var featured_image: Thumbnails
       // var catagories: Categories
       // var tags: Tags
       // var organizers: Organizers
    }
    
    struct Post: Codable {
        var ID: Int
        var post_author: String
        var post_date: String
        var post_content: String
        var post_title: String
        var post_excerpt: String
        var post_status: String
        var comment_status: String
        var ping_status: String
        var post_password: String
        var post_name: String
        var to_ping: String
        var pinged: String
        var post_modified: String
        var post_modified_gmt: String
        var post_content_filtered: String
        var post_parent: Int
        var guid: String
        var menu_order: Int
        var post_type: String
        var post_mime_type: String
        var comment_count: String
        var filter: String
    }
    
    struct Meta: Codable {
      //  var mecColor: String
      // var thumbnailID: String
    //    var mecReadMore: String
        var mec_more_info: String
    /*    var mecMoreInfoTitle: String
        var mecMoreInfoTagret: String
        var mecCost: String
        var mecCurrency: [String]
        var mecNote: String
        var fesGuestEmail: String
        var fesGuestName: String
        var mecLocationID: String
        var mecDontShowMap: String
        var mecOrganizerID: String
        var mecAdditionalOrganizerIDs: [String]
        var mecAditionalLocationIDs: [String]
        var mecStartDate: String
        var mecStartTimeHour: String
        var mecStartTimeMinute: String
        var mecStartTimeAMPM: String
        var mecStartDaySeconds: String
        var mecEndDate: String
        var mecEndTimeHour: String
        var mecEndTimeMinutes: String
        var mecEndtimeAMPM: String
        var mecEndDaySeconds: String
        var mecDate:  MecDate
        var mecRepeat: Repeat
        var mecCertainWeekdays: [String]
        var mecAllday: String
        var oneOccurence: String
        var mecHideTime: String
        var mecHideEndTime: String
        var mecComment: String
        var mecTimezone: String
        var mecCountdownMethod: String
        var mecPublic: String
        var mecRepeatStatus: String
        var mecRepeatType: String
        var mecRepeatInterval: String
        var mecRepeatEnd: String
        var mecRepeatEndAtOccurrences: String
        var mecRepeatEndAtDate: String
        var mecAdvancedDays: [String]
        var mecInDays: String
        var mecNotInDays: String
        var mecHourlySchedules: [String]
        var mecBooking: [String]
        var mecTickets: [String]
        var mecFeesGlobalInheritance: String
        var mecFees: [String]
        var mecTicketVariationsGlobalInheritance: String
        var mecTicketVariations: [String]
        var mecRegFieldsGlobalInheritance: String
        var mecRegFields: [String]
        var mecBfixedFields: [String]
        var mecOp: [String]
        var mecEventStatus: String
        var mecMovedOnlineLink: String
        var mecCancelledReason: String
        var mecFields: [String]
        var mecEvenDateSubmit: String
        var editLock: String
        var lastEditorUsedJetpack: String
        var editlast: String
        var mecDisplayCancellationResonInSinglePage: String
        var etPbPostHideNav: String
        var etPbPageLayout: String
        var etPbSideNav: String
        var youstWpseoPrimaryMecCatagory: String
        var yoastWpesoContentScore: String
        var yoastWpseoEstimatedReadingTimeMinutes: String
        var etEnqueuePostFonts: PostFonts
        var eventPast: Bool*/
    }
    
    struct MecDate: Codable {
        var start: MecDateTime
        var end: MecDateTime
        var comment: String
        var dateRepeat: Repeat
    }
    
    struct MecDateTime: Codable{
        var date: String
        var hour: String
        var minutes: String
        var ampm: String
    }
    
    struct Repeat: Codable {
        var type: String
        var interval: String
        var advanced: String
        var end: String
        var endAtDate: String
        var endAtOccurrence: String
    }
    
    
    struct PostFonts: Codable {
        var family: Family
        var subset: [String]
    }
    
    struct Family: Codable{
        var etGfRokkitt: String
        var etGfRoboto: String
    }
    
    
    struct Mec: Codable{
        var id: String
        var post_id: String
        var start: String
        var end: String
        var `repeat`: String
       // var rinterval: String
      //  var year: String
        //var month: String
        //var day: String
        //var week: String
        //var weekday: String
        //var weekdays: String
        var days: String
        var not_in_days: String
        var time_start: String
        var time_end: String
    }
    
    struct Time: Codable {
        var start: String
        var end: String
        var start_raw: String
        var end_raw: String
        var start_timestamp: Int
        var end_timestamp: Int
    }
    
    struct Thumbnails: Codable {
        var thumbnail: String
        var thumblist: String
        var gridSquare: String
        var meccarouselthumb: String
        var medium: String
        var large: String
        var full: String
        var titleview: String
    }
    
    struct Date: Codable{
        var start: DateData
        var end: DateData
    }
    
    struct DateData: Codable {
        var date: String
    }
    
    struct Categories: Codable {
        
    }
    
    struct Tags: Codable {
        
    }
    
    struct Organizers: Codable {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingSymbol.startAnimating()
        let urlString = "https://www.gaycity.org/wp-json/mecexternal/v1/calendar/12160"
        self.loadJson(fromURLString: urlString) { (result) in
            switch result {
            case .success(let data):
                let dataString = String(data: data, encoding: .utf8)
                //removes all control characters becasue they cause errors
                let dataStringRemovedCtrlChars = self.removingControlCharacters(inputString: dataString!)
                let arrayOfEvents = self.getContentJson(inputString: dataStringRemovedCtrlChars)
                if arrayOfEvents != ""{
                    let data = arrayOfEvents.data(using: .utf8)
                    self.eventData = self.parse(jsonData: data!)
                }
                self.isDone = true
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        while(!isDone){
            
        }
        loadingSymbol.stopAnimating()
        loadingSymbol.isHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func getContentJson(inputString: String) -> String{
        var finalString = ""
        //find begining of events
        let startIndex = inputString.endIndex(of: "content_json\":")!
        //find the end of the events
        
        let endIndex = inputString.index(of: "},\"content_html\"")
        
        if endIndex != nil{
            var eventString = inputString[startIndex..<endIndex!]
            //the start of the array of events
            var firstBracket = eventString.index(of: "[")!
            eventString = inputString[firstBracket..<endIndex!]
            //find the start of the next array
            var index = eventString.index(of: ":[{\"ID\"")
            while(index != nil){
                var currentChar: Int = eventString.distance(from: eventString.startIndex, to: index!)
                //back track from the start of the next array to find the end of the first
                while(eventString[currentChar] != "]"){
                    currentChar-=1
                }
                let endEventsArrayIndex = eventString.index(eventString.startIndex, offsetBy: currentChar)
                //add the first array to the final string
                finalString.append(eventString[eventString.startIndex..<endEventsArrayIndex] + ",")
                //cut the first array out off the eventString
                eventString = eventString[endEventsArrayIndex..<eventString.endIndex]
                //find the start of the next array
                firstBracket = eventString.index(of: "{")!
                eventString = eventString[firstBracket..<endIndex!]
                //if nil there are no more arrays of events
                index = eventString.index(of: ":[{\"ID\"")
            }
            //append the final array to the final string
            finalString.append(eventString[eventString.startIndex..<eventString.endIndex] + "")
            return finalString
        }
        return ""
    }
    
    func removingControlCharacters(inputString: String) -> String {
        let controlChars = CharacterSet.controlCharacters
        var range = (inputString as NSString).rangeOfCharacter(from: controlChars)
        if range.location != NSNotFound {
            var mutable = inputString
            while range.location != NSNotFound {
                if let subRange = Range<String.Index>(range, in: mutable) { mutable.removeSubrange(subRange) }
                range = (mutable as NSString).rangeOfCharacter(from: controlChars)
            }
            return mutable
        }
        return inputString
    }
    
    private func parse(jsonData: Data) -> [EventData]{
            return try! JSONDecoder().decode([EventData].self, from: jsonData)
    }
    
    private func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
    
    

    
    
}

extension QCCEventViewController: UITableViewDelegate{
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventView = self.storyboard?.instantiateViewController(withIdentifier: "qccEventDetailsView") as? QCCEventDetailsViewController
        
        let event = eventData[indexPath.item]
        eventView?.configure(eventTitle: event.data.title, eventStartTimeAndDate: (event.date.start.date + " " + event.data.time.start), eventBody: event.data.content, eventLink: event.data.meta.mec_more_info)
        eventView?.modalPresentationStyle = .fullScreen
        self.present(eventView!, animated: true, completion: nil)
    }
}

extension QCCEventViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventCustomCell
        
        let event = eventData[indexPath.item]
        cell.configure(eventTitle: event.data.title, eventStartDate: event.date.start.date, eventStartTime: event.data.time.start)
        
        return cell
    }
    
}






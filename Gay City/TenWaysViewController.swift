//
//  10WaysViewController.swift
//  Gay City
//
//  Created by Ian Fahning on 5/31/21.
//

import Foundation
import UIKit
import WebKit

class TenWaysViewController: ViewController {
    
    @IBOutlet weak var voterEligibilityButton: UIButton!
    @IBOutlet weak var cehckRegistrationButton: UIButton!
    @IBOutlet weak var completeRegistrationButton: UIButton!
    @IBOutlet weak var trackBallotButton: UIButton!
    @IBOutlet weak var findVoteCenterButton: UIButton!
    @IBOutlet weak var emailCommunityButton: UIButton!
    private let webView = WKWebView(frame: .zero)
    private let web = TrainingAndOutreachWebview()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

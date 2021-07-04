//
//  VoterEligibilityWebView.swift
//  Gay City
//
//  Created by Ian Fahning on 6/5/21.
//

import UIKit
import WebKit
class VoterEligibilityWebView: UIViewController, WKUIDelegate,WKNavigationDelegate{

    @IBOutlet var webView: WKWebView!
    private var url: String = "https://www.kingcounty.gov/depts/elections/how-to-vote/register-to-vote/who-can-vote.aspx?utm_source=Gay%20City%20LGBTQ%20Center&utm_medium=website&utm_campaign=Election_2020"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

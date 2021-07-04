//
//  CompleteRegistrationWebView.swift
//  Gay City
//
//  Created by Ian Fahning on 6/5/21.
//

import UIKit
import WebKit
class CompleteRegistartionWebView: UIViewController, WKUIDelegate,WKNavigationDelegate{

    @IBOutlet var webView: WKWebView!
    private var url: String = "https://www.kingcounty.gov/depts/elections/how-to-vote/register-to-vote.aspx%20"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

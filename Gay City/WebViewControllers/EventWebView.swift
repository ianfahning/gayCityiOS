//
//  EventWebViewController.swift
//  Gay City
//
//  Created by Ian Fahning on 7/2/21.
//

import UIKit
import WebKit
class EventWebView: UIViewController, WKUIDelegate,WKNavigationDelegate{

    @IBOutlet var webView: WKWebView!
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

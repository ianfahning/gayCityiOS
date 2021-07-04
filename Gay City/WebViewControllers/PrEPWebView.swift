//
//  PrEPWebView.swift
//  Gay City
//
//  Created by Ian Fahning on 6/5/21.
//

import UIKit
import WebKit
class PrEPWebview: UIViewController, WKUIDelegate,WKNavigationDelegate{

    @IBOutlet var webView: WKWebView!
    private var url: String = "https://docs.google.com/forms/d/e/1FAIpQLSfoGdsDTkr-Zd8Y5UYZj6t9JEHZXe9GHnSBcn4Uy4jSmHNORA/viewform"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

//
//  TwitterWebView.swift
//  Gay City
//
//  Created by Ian Fahning on 6/5/21.
//

import UIKit
import WebKit
class TwitterWebView: UIViewController, WKUIDelegate,WKNavigationDelegate{

    @IBOutlet var webView: WKWebView!
    private var url: String = "https://twitter.com/gaycityseattle"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

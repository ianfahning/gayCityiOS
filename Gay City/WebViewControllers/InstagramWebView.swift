//
//  InstagramWebView.swift
//  Gay City
//
//  Created by Ian Fahning on 6/5/21.
//

import UIKit
import WebKit
class InstagramWebView: UIViewController, WKUIDelegate,WKNavigationDelegate{

    @IBOutlet var webView: WKWebView!
    private var url: String = "https://instagram.com/gaycity"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

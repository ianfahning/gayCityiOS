//
//  TrainingAndOutreachWebview.swift
//  Gay City
//
//  Created by Ian Fahning on 5/29/21.
//

import UIKit
import WebKit
class TrainingAndOutreachWebview: UIViewController, WKUIDelegate,WKNavigationDelegate{

    @IBOutlet var webView: WKWebView!
    private var url: String = "https://docs.google.com/forms/d/e/1FAIpQLSdGfvL-DRyYIz7rhoP2lw5Wldlj0XRnkWASHzYK_VoYi_6uXA/viewform?usp=sf_link&utm_source=Gay%20City%20LGBTQ%20Center&utm_medium=website&utm_campaign=Outreach"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

    

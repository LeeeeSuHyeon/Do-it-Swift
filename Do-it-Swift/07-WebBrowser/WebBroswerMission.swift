//
//  WebBroswerMission.swift
//  Do-it-Swift
//
//  Created by 이수현 on 6/28/24.
//

import UIKit
import WebKit

class WebBroswerMission : UIViewController {
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        if let filePath = Bundle.main.path(forResource: "htmlMissionView", ofType: "html"){
            let myURL = URL(fileURLWithPath : filePath)
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
        }
    }
}

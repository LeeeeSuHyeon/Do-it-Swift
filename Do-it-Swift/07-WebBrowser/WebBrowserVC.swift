//
//  WebBrowserVC.swift
//  Do-it-Swift
//
//  Created by 이수현 on 6/27/24.
//

import UIKit
import WebKit

class WebBrowserVC : ViewController, WKNavigationDelegate {
    @IBOutlet weak var txtURL: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!    // 앱 로딩 뷰 (원형)
    
    // 웹 페이지 주소를 url의 인수를 통해 전달해서 웹 페이지를 보여주는 함수
    func loadWebPage(_ url : String){
        if let myURL = URL(string: url){
            let myRequest = URLRequest(url: myURL)
            myWebView.load(myRequest)
        }
    }
    
    func checkUrl(_ url : String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    override func viewDidLoad() {
        myWebView.navigationDelegate = self
        loadWebPage("https://soo-hyn.tistory.com/")
    }
    
    // 로딩 중일 때 함수
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    // 로딩이 완료되었을 떄 함수
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // 로딩 실패 시 동작 함수
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    @IBAction func btnGotoURL(_ sender: UIButton) {
        let myURL = checkUrl(txtURL.text!)
        txtURL.text = ""
        loadWebPage(myURL)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://github.com/LeeeeSuHyeon")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://chatgpt.com/")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹페이지 </p><p><a href=\"https://soo-hyn.tistory.com\">soo_hyn</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        if let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html"){
            let myURL = URL(fileURLWithPath : filePath)
            let myRequest = URLRequest(url: myURL)
            myWebView.load(myRequest)
        }
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}

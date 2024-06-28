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
        
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
    }
}

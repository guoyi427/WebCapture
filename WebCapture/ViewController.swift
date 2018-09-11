//
//  ViewController.swift
//  WebCapture
//
//  Created by Gray on 2018/9/11.
//  Copyright © 2018年 Gray. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func awakeFromNib() {
        webView.navigationDelegate = self
        guard let contentURL = URL(string: "http://www.baidu.com") else { return }
        let webRequest = URLRequest(url: contentURL)
        webView.load(webRequest)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.head.outerHTML") { (response, error) in
            if let n_error = error {
                print(n_error)
            }
            guard let n_resp = response else { return }
            print(n_resp)
        }
    }
}

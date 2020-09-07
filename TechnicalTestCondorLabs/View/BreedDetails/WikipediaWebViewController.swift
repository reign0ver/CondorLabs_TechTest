//
//  WikipediaWebViewController.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import UIKit
import WebKit

class WikipediaWebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    private var webViewURL: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        loadRequest()
    }
    
    init(webViewURL: String) {
        self.webViewURL = webViewURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadRequest() {
        guard let url = URL(string: webViewURL) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
}

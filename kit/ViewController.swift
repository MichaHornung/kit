//
//  ViewController.swift
//  kit
//
//  Created by Michael Hornung on 05.12.22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        URL laden
        
        let url = URL(string: "https://www.rendo-shrimp.de/")!
        webView.load(URLRequest(url:url))
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        
        //        Search Bar
        
        searchBar.text = url.absoluteString
        searchBar.delegate = self
        searchBar.autocapitalizationType = .none
    }
    
    @IBAction func backButtonClick(_sender: UIButton){
        webView.goBack()
    }
    @IBAction func forwardButtonClick(_sender: UIButton){
        webView.goForward()
    }
}
    
//    Suche über Search Bar einrichten
    
    extension ViewController:WKNavigationDelegate{
        func webView(_ sender: WKWebView, didFinish navigation: WKNavigation!){
            self.searchBar.text = webView.url!.absoluteString
        }
    }


extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        let searchText = searchBar.text!
        searchBar.resignFirstResponder()
        let newURL = URL(string: "https://www.\(searchText).com")!
        webView.load(URLRequest(url: newURL))
        searchBar.text = newURL.absoluteString
    }
}



//
//  ViewController.swift
//  MyWebBrowser
//
//  Created by Egemen Çığ on 29.06.2020.
//  Copyright © 2020 Egemen Çığ. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate, WKUIDelegate {
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myWebView: WKWebView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.uiDelegate = self
        myWebView.load(URLRequest(url: URL(string: "https://www.google.com")!))
        mySearchBar.text = "https://"
    }

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        mySearchBar.resignFirstResponder()
        
        if let url = URL(string: mySearchBar.text!)
        {
            myWebView.load(URLRequest(url: url))
        }
        else {
            print("ERROR")
        }
    }
    
    
    @IBAction func back(_ sender: Any)
    {
        
        if myWebView.canGoBack {
            myWebView.goBack()
        }
        
    }
    
    @IBAction func next(_ sender: Any)
    {
        
        if myWebView.canGoForward {
            myWebView.goForward()
        }
        
    }
    
    @IBAction func refresh(_ sender: Any)
    {
        
        myWebView.reload()
        
    }


}


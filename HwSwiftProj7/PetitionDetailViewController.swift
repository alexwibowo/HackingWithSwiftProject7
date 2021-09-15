//
//  PetitionDetailViewController.swift
//  HwSwiftProj7
//
//  Created by Alex Wibowo on 15/9/21.
//

import UIKit
import WebKit

class PetitionDetailViewController: UIViewController {
    var petition : Petition?
    
    var webView : WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.loadHTMLString("""
                    <html>
                        <head>
                        <meta name="viewport" content="width=device-width, initial-scale=1">
                        <style> body { font-size: 150%} </style>
                        </head>
                        <body>
                        \(petition!.body)
                        </body>
                    </html>
            
            """, baseURL: nil)
     
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

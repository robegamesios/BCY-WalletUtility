//
//  ViewController.swift
//  BCY-WalletUtility
//
//  Created by Rob Enriquez on 2/12/17.
//  Copyright © 2017 Robert Enriquez. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func postCurl() {
        //GET ACCESS TOKEN
        let str = "5cee913bf0e04890bb37f7d301192a67"
        let utf8str = str.data(using: String.Encoding.utf8)
        //let basic_auth_token = utf8str?.base64EncodedStringWithOptions(NSData.Base64EncodingOptions(rawValue: 0))
        let basic_auth_token = utf8str?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
        let headers = ["Accept" : "application/json", "Authorization" :"Basic "+basic_auth_token!]
        
        Alamofire.request("https://api.sandbox.paypal.com/v1/oauth2/token",
                          method: .post, parameters: parameters, encoding:URLEncoding.default,
                          headers: headers)
            .responseJSON { response in
                SwiftLoader.hide()
                
                print(response.request as Any)  // original URL request
                print(response.response as Any) // URL response
                print(response.result.value as Any)   // result of response serialization
                
                
                
        }
    }

}


//
//  RequestSender.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 30.06.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation
import SwiftyJSON


class RequestSender {
    
    private let testUrlString = "http://search.cocoapods.org/api/v1/pods.picky.hash.json?query=on:ios"
    
    private let apiStringBase = "http://search.cocoapods.org/api/pods?"
    
    private let queryStringIOS = "query=on:ios"
    private let queryStringMACOS = "query=on:osx"
    private let queryAmountStringBase = "amount="
    private let queryStart_atStringBase = "start-at="
    private let and = "&"
    
    private var amount = 30
    var start_at = 0
    
    
    
    
    public func sendRequest(forOS: OS, start_at: Int, parseHander: @escaping (_ responce: Data?, _ error: Error?) -> Void) {
        
        self.start_at = start_at
        var queryOsString = ""
        if forOS == .iOS {
            queryOsString = queryStringIOS
        } else {
            queryOsString = queryStringMACOS
        }
        
        let urlString = apiStringBase + queryOsString + and + queryAmountStringBase + "\(amount)" + and + queryStart_atStringBase + "\(start_at)"
        
        
        guard let apiUrl = URL(string: urlString) else {
            print("unable to get to requested url")
            return
        }
        
        let mutableRequest = NSMutableURLRequest(url: apiUrl)
        mutableRequest.addValue("application/vnd.cocoapods.org+picky.hash.json; version=1", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: mutableRequest as URLRequest) { responce,_, error in
            
            parseHander(responce, error)
        }
        task.resume()
    }
}


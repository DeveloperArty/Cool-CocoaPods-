//
//  RequestSender.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 30.06.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class RequestSender {
    
    private let apiUrlString =  "http://search.cocoapods.org/api/v1/pods.picky.hash.json?query=on:ios"
    
    public func sendRequest(parseHander: @escaping (_ responce: DataResponse<Any>) -> Void) {
        
        
        guard let apiUrl = URL(string: apiUrlString) else {
            print("unable to get to requested url")
            return
        }
        
        Alamofire.request(apiUrl).responseJSON() { responce in
            parseHander(responce) 
        }
    }
}


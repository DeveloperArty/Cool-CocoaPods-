//
//  PodDetailsDataProviderImp.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 08.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation
import SwiftyJSON

class PodDetailsDataProviderImp: PodDetailsDataProvider {
    func test(gitLink: String, completionHandler: @escaping (_ readme: String)-> Void) {
        
        let authorsAndRepoNameArray = gitLink.components(separatedBy: ".com/")
        
        guard authorsAndRepoNameArray.count > 1  else { return }
        var authorsAndRepoName = authorsAndRepoNameArray[1]
        
        
        if authorsAndRepoName.components(separatedBy: ".").count > 1 {
            authorsAndRepoName = authorsAndRepoName.components(separatedBy: ".")[0]
        }
        
        
        let urlString = "https://api.github.com/repos/\(authorsAndRepoName)/readme"
        let acceptHeader = "application/vnd.github.v3+json"
        
        guard let url = URL(string: urlString) else { return }
        let mutableRequest = NSMutableURLRequest(url: url)
        mutableRequest.setValue(acceptHeader, forHTTPHeaderField: "Accept")
        mutableRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: mutableRequest as URLRequest) { (responseData,_,error) in
            
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            if let data = responseData {
            
                let json = JSON(data)
                if let encodedString = json["content"].string {
                    
                    if let data: NSData = NSData(base64Encoded: encodedString,
                                                 options: NSData.Base64DecodingOptions.ignoreUnknownCharacters) {
                        if let base64Decoded: NSString = NSString(data: data as Data,
                                                                  encoding: String.Encoding.utf8.rawValue) {
                            completionHandler(base64Decoded as String)
                        }
                    } 
                } else {
                    print("no 'content' row in json")
                }
                
            } else {
                print("nil data recieved")
            }
        }
        task.resume()
    }
}

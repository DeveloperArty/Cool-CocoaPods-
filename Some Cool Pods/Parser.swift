//
//  Parser.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 02.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation
import SwiftyJSON

class ApiDataParser {
  
    func parseResponce(responce: Data?, errorDiscription: String?, completionHander: @escaping (_ pods: [Pod],_ error: String?) -> Void ) {
        var result = [Pod]()
        
        guard errorDiscription == nil else {
            print(errorDiscription!)
            return
        }
        guard let data = responce else {
            print("Error: responce does not contain data")
            return
        }
        let json = JSON(data: data)
        print(json)
        
        let allocations = json["allocations"][0][5]
        
        
        for allocation in allocations {
            let aljson = allocation.1
            
            let authors = aljson["authors"].dictionaryValue
            var authorsString = ""
            for author in authors.keys {
                authorsString += author
            }
            
            let pod = Pod(id: aljson["id"].stringValue ,
                          version: aljson["version"].stringValue,
                          summary: aljson["summary"].stringValue,
                          authors: authorsString,
                          link: aljson["link"].stringValue,
                          sourceGit: aljson["source"]["git"].stringValue)
            result.append(pod)
        }
        
        completionHander(result, errorDiscription)

    }

}

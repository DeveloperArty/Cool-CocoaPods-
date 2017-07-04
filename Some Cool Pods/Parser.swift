//
//  Parser.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 02.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire 

class ApiDataParser {
  
    func parseResponce(responce: DataResponse<Any>, completionHander: @escaping (_ pods: [Pod],_ error: Error?) -> Void ) {
        var result = [Pod]()
        
        guard responce.error == nil else {
            print(responce.error!.localizedDescription)
            return
        }
        guard let data = responce.data else {
            print("Error: responce does not contain data")
            return
        }
        let json = JSON(data: data)
        
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
        
        completionHander(result, responce.error)

    }

}
    

    
//    
//    
//    
//    func parseResponce(data: Data?, error: Error?) -> [Pod]? {
//        guard error == nil else {
//            if let description = error?.localizedDescription {
//                print(description)
//            }
//            return nil
//        }
//        guard let responce = data else {
//            print("no data recieved")
//            return nil
//        }
//        
//        
//        let json = JSON(data: responce)
//        
//        let allocations = json["allocations"][0][5]
//        
//        var result = [Pod]()
//        
//        for allocation in allocations {
//            let aljson = allocation.1
//            
//            let authors = aljson["authors"].dictionaryValue
//            var authorsString = ""
//            for author in authors.keys {
//                authorsString += author
//            }
//            
//            let pod = Pod(id: aljson["id"].stringValue ,
//                          version: aljson["version"].stringValue,
//                          summary: aljson["summary"].stringValue,
//                          authors: authorsString,
//                          link: aljson["link"].stringValue,
//                          sourceGit: aljson["source"]["git"].stringValue)
//            print(pod.id)
//            result.append(pod)
//        }
//
//        return result
//        
//    }
//    
//

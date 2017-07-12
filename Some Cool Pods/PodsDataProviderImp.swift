//
//  PodsDataProviderImp.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 02.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation

class PodsDataProviderImp: PodsDataProvider {
    
    let requestSender = RequestSender()
    let parser = ApiDataParser()
    
    func getPods(forOS: OS, start_at: Int, complertionHandler: @escaping (_ pods: [Pod], _ error: String?) -> Void ) {
        requestSender.sendRequest(forOS: forOS, start_at: start_at) { response, error in
            
            let errorDiscription = error?.localizedDescription
             
            self.parser.parseResponce(responce: response, errorDiscription: errorDiscription, completionHander: complertionHandler)
        }
    }
}

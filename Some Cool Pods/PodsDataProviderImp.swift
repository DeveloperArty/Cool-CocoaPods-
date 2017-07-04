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
    
    func getLatestPods(complertionHandler: @escaping (_ pods: [Pod], _ error: Error?) -> Void ) {
        requestSender.sendRequest() { response in
            self.parser.parseResponce(responce: response, completionHander: complertionHandler)
        }
    }
}

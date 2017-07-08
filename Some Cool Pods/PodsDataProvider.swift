//
//  PodsDataProvider.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 02.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation

protocol PodsDataProvider {
    func getTestIOSPods(complertionHandler: @escaping (_ pods: [Pod], _ error: Error?) -> Void ) 
}


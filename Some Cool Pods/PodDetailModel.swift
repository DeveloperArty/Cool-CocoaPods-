//
//  PodDetailModel.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 08.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation
import UIKit


protocol PodDetailModelDelegate: class {
    weak var tableView: UITableView! {get}
}

class PodDetailModel {
    
    // Properties
    private let delegate: PodDetailModelDelegate
    
    // init
    init(delegate: PodDetailModelDelegate) {
        self.delegate = delegate
    }
    
    //
    public func startLoadingPodDetails() {
        // serviceLayer ..
    }
}

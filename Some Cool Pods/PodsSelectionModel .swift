//
//  PodsSelectionModel .swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 01.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation
import UIKit


protocol PodsSelectionModelDelegate: class {
    weak var tableView: UITableView! {get}
}


class PodsSelectionModel {
    
    // init
    init(delegate: PodsSelectionModelDelegate) {
        self.delegate = delegate
    }
    
    // TO DO: Fabric
    let dataService: PodsDataProvider = PodsDataProviderImp()
    //
    weak var delegate: PodsSelectionModelDelegate?
    var allLoadedPods = [Pod]() {
        willSet {
            DispatchQueue.main.async {
                if self.delegate != nil {
                    self.delegate!.tableView.reloadData()
                }
            }
        }
    }
    
    func startLoadingPods() {
        dataService.getLatestPods() { pods, error in
            guard error == nil else {
                // error handling
                return
            }
            
            self.allLoadedPods = pods 
            
        }
    }
}



class Pod {
    
    let id: String
    let version: String
    let summary: String
    let authors: String
    let link: String
    let sourceGit: String
    
    init(id: String, version: String, summary: String, authors: String, link: String, sourceGit: String) {
        self.id = id
        self.version = version
        self.summary = summary
        self.authors = authors
        self.link = link
        self.sourceGit = sourceGit
    }
    
}

//
//  PodsSelectionModel .swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 01.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation
import UIKit

class PodsSelectionModel {
    
    init(delegate: PodsSelectionModelDelegate) {
        self.delegate = delegate
    }
    
    let delegate: PodsSelectionModelDelegate
    var allLoadedPods = [Pod]() {
        didSet {
            DispatchQueue.main.sync {
                self.delegate.tableView.reloadData()
            }
        }
    }
}

protocol PodsSelectionModelDelegate {
    weak var tableView: UITableView! {get}
}


class Pod {
    
    let id: String
    let version: String
    let summary: String
    let authors: String
    let link: URL
    let sourceGit: URL
    
    init(id: String, version: String, summary: String, authors: String, link: URL, sourceGit: URL) {
        self.id = id
        self.version = version
        self.summary = summary
        self.authors = authors
        self.link = link
        self.sourceGit = sourceGit
    }
    
}

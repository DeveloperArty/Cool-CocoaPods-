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
        dataService.getTestIOSPods() { pods, error in
            guard error == nil else {
                // error handling
                return
            }
            
            self.allLoadedPods = pods 
            
        }
    }
}



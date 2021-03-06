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
    var currentOS: OS {get}
    
    func presentAlert(message: String)
}


class PodsSelectionModel {
    
    // init
    init(delegate: PodsSelectionModelDelegate) {
        self.delegate = delegate
    }
    
    // TO DO: Fabric
    let dataService: PodsDataProvider = PodsDataProviderImp()
    var delegate: PodsSelectionModelDelegate?
    //
    var numberOfLoadedPods = 0
    var allLoadedPods = [Pod]() {
        willSet {
            print("pods loaded total: \(newValue.count)")
            self.numberOfLoadedPods = newValue.count
            DispatchQueue.main.async {
                if self.delegate != nil {
                    self.delegate!.tableView.reloadData()
                }
            }
        }
    }
    
    func startLoadingPods() {
        dataService.getPods(forOS: (delegate?.currentOS)!, start_at: self.numberOfLoadedPods) { pods, error in
            if pods.isEmpty {
                DispatchQueue.main.async {
                    self.delegate?.presentAlert(message: "Unable to access server. Please try again later")
                }
            }
            self.allLoadedPods.append(contentsOf: pods)
            guard error == nil else {
                print("an error occured, presenting alert..")
                self.delegate?.presentAlert(message: error!)
                return
            }
        }
    }
    
    func resetData() {
        self.allLoadedPods = [Pod]()
    }
}



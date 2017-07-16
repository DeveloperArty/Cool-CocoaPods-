//
//  PodsSelectionViewController.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 30.06.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import UIKit
import ChameleonFramework
import DZNEmptyDataSet
import PKRevealController

class PodsSelectionViewController: UIViewController, PodsSelectionModelDelegate, SupportsOS {

    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Properties 
    let emptyBackgroundColor: UIColor = FlatBlack()
    fileprivate let footerHeight: CGFloat = 100
    var currentOS: OS = .iOS {
        willSet {
            self.podsSelectionModel.resetData() 
            self.podsSelectionModel.startLoadingPods()
            if newValue == .iOS {
                self.navigationItem.title = "iOS Pods"
            } else {
                self.navigationItem.title = "OS X Pods"
            }
        }
    }
    fileprivate lazy var podsSelectionModel: PodsSelectionModel = PodsSelectionModel(delegate: self)
    
    // Lifedcycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TV setup
        tableView.dataSource = self
        tableView.delegate = self 
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        
        // DZN
        tableView.emptyDataSetSource = self
        tableView.separatorColor = FlatWhite()
        
        // Deleting separators if nil content
        tableView.tableFooterView = UIView()
        
        // Load init
        podsSelectionModel.startLoadingPods()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let vc = segue.destination as? PodDetailViewController {
            vc.pod = sender as? Pod 
        }
    }
    
    // UI Envents 
    @IBAction func openMenu(_ sender: UIBarButtonItem) {
        revealController.enterPresentationMode(animated: true, completion: nil)
    }
    
    func presentAlert(message: String) {
        let alertC = UIAlertController(title: "Unable to load data",
                                       message: message,
                                       preferredStyle: .alert)
        let actionRepeat = UIAlertAction(title: "Try again",
                                         style: .default,
                                         handler: { action in self.podsSelectionModel.startLoadingPods() })
        alertC.addAction(actionRepeat)
        self.present(alertC,
                     animated: true,
                     completion: nil)
    }
    
    
}


// MARK: TV Data Source
extension PodsSelectionViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podsSelectionModel.allLoadedPods.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < podsSelectionModel.allLoadedPods.count {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "pod cell", for: indexPath) as! PodsTableViewCell
            
            // cell content setup
            let pod = podsSelectionModel.allLoadedPods[indexPath.row]
            cell.idLabel.text = pod.id
            cell.autorsLabel.text = pod.authors
            cell.summaryLabel.text = pod.summary
            
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "loaderCell", for: indexPath) as! LoaderTableViewCell
            cell.activityIndicator.startAnimating()
            return cell
        }
    }
}

extension PodsSelectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath) is PodsTableViewCell {
            let pod = self.podsSelectionModel.allLoadedPods[indexPath.row]
            self.performSegue(withIdentifier: "podDetail", sender: pod)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell is LoaderTableViewCell && indexPath.row != 0  {
            self.podsSelectionModel.startLoadingPods()
        }
    }
}

// DZN DataSource
extension PodsSelectionViewController: DZNEmptyDataSetSource {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "Loading freshest pods.."
        return NSAttributedString(string: text, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 30),
                                                             NSForegroundColorAttributeName: ContrastColorOf(emptyBackgroundColor, returnFlat: true)])
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return emptyBackgroundColor
    }
}



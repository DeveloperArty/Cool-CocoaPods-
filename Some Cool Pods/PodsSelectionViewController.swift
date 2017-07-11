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

class PodsSelectionViewController: UIViewController, PodsSelectionModelDelegate {

    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Properties 
    let emptyBackgroundColor: UIColor = FlatBlack()
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
    
    
}


// MARK: TV Data Source
extension PodsSelectionViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podsSelectionModel.allLoadedPods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pod cell", for: indexPath) as! PodsTableViewCell
        
        // cell content setup        
        let pod = podsSelectionModel.allLoadedPods[indexPath.row]
        cell.idLabel.text = pod.id
        cell.autorsLabel.text = pod.authors
        cell.summaryLabel.text = pod.summary
        
        return cell
    }
}

extension PodsSelectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pod = self.podsSelectionModel.allLoadedPods[indexPath.row]
        self.performSegue(withIdentifier: "podDetail", sender: pod)
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



//
//  PodDetailViewController.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 08.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import UIKit
import ChameleonFramework
import DZNEmptyDataSet


class PodDetailViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    
    // Properties
    var pod: Pod? = nil
    let emptyBackgroundColor = RandomFlatColor()
    
    // TO DO: Factory
    let podDetailModel: PodDetailsDataProvider = PodDetailsDataProviderImp()

    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TV setup
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        // DZN
        tableView.emptyDataSetSource = self
        
        // Deleting separators if nil content
        tableView.tableFooterView = UIView()
        
        // initializing content load
        
        if let git = self.pod?.sourceGit {
            podDetailModel.test(gitLink: git) { readme in
                DispatchQueue.main.async {
                    self.textView.text = readme 
                }
            }
        }
        
        // UI Setup 
        setupUI()
    }
    
    func setupUI() {
        
        if let pod = self.pod {
            self.navigationItem.title = pod.id 
        }
    }
    
    // UI Events
    @IBAction func backgroundTap(_ sender: Any) {
        view.endEditing(true)
    }
}

// MARK: TV Data Source
extension PodDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pod cell", for: indexPath)
        
        
        return cell
    }
}

extension PodDetailViewController: UITableViewDelegate {
    
}

// DZN DataSource
extension PodDetailViewController: DZNEmptyDataSetSource {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "Loading pod detatils.."
        return NSAttributedString(string: text, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 30),
                                                             NSForegroundColorAttributeName: ContrastColorOf(emptyBackgroundColor, returnFlat: true)])
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return emptyBackgroundColor
    }
}



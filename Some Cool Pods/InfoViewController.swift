//
//  InfoViewController.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 11.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import UIKit
import ChameleonFramework

class InfoViewController: UIViewController {

    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Properties 
    fileprivate let menuTitles = ["Licenses"]
    fileprivate let segueIDs = ["toLicenses"]
    fileprivate let headerHeight: CGFloat = 150
    fileprivate var footerHeight: CGFloat {
        return self.view.frame.size.height - headerHeight*2
    }
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TV setup
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // UIEvents
    @IBAction func toMenu(_ sender: UIBarButtonItem) {
        revealController.enterPresentationMode(animated: true, completion: nil)
    }
    
    
}

extension InfoViewController: UITableViewDelegate {
    
    // header setup
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: headerHeight))
        header.backgroundColor = ClearColor()
        
        let headerLine = UIView(frame: CGRect(x: 0, y: headerHeight - 1, width: tableView.frame.size.width, height: 1))
        headerLine.backgroundColor = FlatWhiteDark()
        header.addSubview(headerLine)
        
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    
    // footer setup
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: footerHeight))
        footer.backgroundColor = ClearColor()
        
        let footerLine = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        footerLine.backgroundColor = FlatWhiteDark()
        footer.addSubview(footerLine)
        
        return footer
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return footerHeight
    }
    
    // row selection event 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: segueIDs[indexPath.row], sender: nil)
    }
}

extension InfoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        
        cell.backgroundColor = ClearColor()
        cell.textLabel?.text = self.menuTitles[indexPath.row] 
        return cell
    }
}

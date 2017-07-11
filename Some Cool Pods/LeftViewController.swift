//
//  RootPKRevealViewController.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 06.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import UIKit
import PKRevealController
import ChameleonFramework


class LeftViewControllerr: UIViewController {
    
    fileprivate let menuButtonNames = ["iOS", "MAC OS", "Info"]
    let mainColor = FlatBlackDark()
    let secondColor = FlatWhite()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = FlatBlackDark()
        
        // creating indent
        let header = tableView.headerView(forSection: 0)
        header?.backgroundView?.backgroundColor = UIColor.clear
        
        // TV Setup
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = FlatBlackDark()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LeftViewControllerr: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuButtonNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! LeftVCTableViewCell
        
        cell.menuElementNameLabel.text = self.menuButtonNames[indexPath.row]
        cell.menuElementNameLabel.textColor = ContrastColorOf(mainColor, returnFlat: true)
        
        return cell
    }
}

extension LeftViewControllerr: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 200))
        header.backgroundColor = ClearColor()
        return header
    }
}

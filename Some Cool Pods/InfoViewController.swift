//
//  InfoViewController.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 11.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // UIEvents
    @IBAction func toMenu(_ sender: UIBarButtonItem) {
        revealController.enterPresentationMode(animated: true, completion: nil)
    }
}

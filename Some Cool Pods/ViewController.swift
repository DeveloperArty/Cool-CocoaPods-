//
//  ViewController.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 30.06.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import UIKit
import ChameleonFramework

class ViewController: UIViewController {

    @IBOutlet weak var loveLabel: UILabel!
    @IBOutlet weak var tapToStartLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // Setup 
    func setupUI() {
        let color1 = RandomFlatColor()
        view.backgroundColor = GradientColor(.topToBottom,
                                             frame: view.frame,
                                             colors: [color1, RandomFlatColor()])
        loveLabel.textColor = ContrastColorOf(color1, returnFlat: true)
        tapToStartLabel.textColor = ContrastColorOf(color1, returnFlat: true)
    }
    
    // UI Events
    @IBAction func moveNext(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "to tableView Pods", sender: nil)
    }
}


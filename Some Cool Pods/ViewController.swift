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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = GradientColor(.topToBottom,
                                             frame: view.frame,
                                             colors: [RandomFlatColor(), RandomFlatColor()])
    }
}


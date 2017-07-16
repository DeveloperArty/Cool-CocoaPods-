//
//  LoaderTableViewCell.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 16.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import UIKit

class LoaderTableViewCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        self.backgroundColor = UIColor.clear
    }

}

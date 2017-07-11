//
//  LeftVCTableViewCell.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 07.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import UIKit

class LeftVCTableViewCell: UITableViewCell {

    @IBOutlet weak var menuElementNameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}

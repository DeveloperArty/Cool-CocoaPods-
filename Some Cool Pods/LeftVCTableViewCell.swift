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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

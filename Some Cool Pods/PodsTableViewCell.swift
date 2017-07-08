//
//  PodsTableViewCell.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 30.06.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import UIKit
import MGSwipeTableCell
import ChameleonFramework

class PodsTableViewCell: MGSwipeTableCell {
    
    // Outlets
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var autorsLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        
        let color = FlatBlack()
        self.backgroundColor = color 
        idLabel.textColor = ContrastColorOf(color, returnFlat: true)
        autorsLabel.textColor = ContrastColorOf(color, returnFlat: true)
        summaryLabel.textColor = ContrastColorOf(color, returnFlat: false)
    }
}

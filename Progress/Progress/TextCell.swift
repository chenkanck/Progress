//
//  TextCell.swift
//  Progress
//
//  Created by Kan Chen on 8/22/15.
//  Copyright (c) 2015 Zap. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
